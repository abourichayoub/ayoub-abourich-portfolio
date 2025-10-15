
% create_half_bridge_model.m
% MATLAB script to programmatically create a Simulink/Simscape model for a
% Half-Bridge isolated DC/DC converter with transformer and full-wave rectifier.
% Intended for MATLAB/Simulink R2024b with Simscape Electrical (Specialized Power Systems).
%
% Usage:
% 1) Place this file in a folder on MATLAB path.
% 2) In MATLAB, run: create_half_bridge_model
% 3) The script will create and open a model named 'half_bridge_converter'.
%
% Notes/compatibility:
% - Block library root names can vary across releases. If the script fails to
%   find a library block it will print a warning and continue; you may need to
%   manually replace that block in the generated model using the Library Browser.
% - This script tries to use common paths: 'powerlib' (Simscape Electrical).
% - After the model is created, open it in Simulink, run Powergui (if present),
%   and simulate. You may need to set solver to a stiff solver (ode23tb) and a
%   sufficiently small max step for switching simulation.
%
%% Begin script
model = 'half_bridge_converter';
% close if exists
if bdIsLoaded(model)
    close_system(model,0);
end
new_system(model);
open_system(model);

% helper to attempt to add a block and fallback message
function blk = tryAddBlock(src, dest)
    try
        add_block(src, dest, 'MakeNameUnique', 'on');
        blk = dest;
    catch ME
        warning('Could not add block "%s" -> "%s". Error: %s', src, dest, ME.message);
        blk = '';
    end
end

% Coordinates helper
x = 30; y = 30; dx = 140; dy = 90;

% Add Powergui if available (powerlib root)
try
    add_block('powerlib/Powergui', [model '/Powergui']);
catch
    try
        add_block('powergui', [model '/Powergui']);
    catch
        warning('Powergui block not found. Simulation of electrical networks may require it to be added manually.');
    end
end

% DC Voltage source
srcPath1 = 'powerlib/Elements/DC Voltage Source';
tryAddBlock(srcPath1, [model '/Vdc']);

% Capacitor C1 and C2 (use Series RLC Branch in capacitive mode if Capacitor block not available)
capBlock = 'powerlib/Elements/Series RLC Branch';
tryAddBlock(capBlock, [model '/C1']);
tryAddBlock(capBlock, [model '/C2']);

% Resistors for balancing (use Resistive load)
resBlock = 'powerlib/Elements/Series RLC Branch';
tryAddBlock(resBlock, [model '/Rbal1']);
tryAddBlock(resBlock, [model '/Rbal2']);

% Half-bridge switches: use IGBT (ideal) or Universal Bridge as fallback
igbtBlk = 'powerlib/Power Electronics/IGBT (Ideal)';
ubBlk = 'powerlib/Power Electronics/Universal Bridge';
swHigh = tryAddBlock(igbtBlk, [model '/S_high']);
if isempty(swHigh)
    swHigh = tryAddBlock(ubBlk, [model '/UniversalBridge']);
end
% Duplicate for low switch
swLow = tryAddBlock(igbtBlk, [model '/S_low']);
if isempty(swLow)
    swLow = tryAddBlock(ubBlk, [model '/UniversalBridge2']);
end

% Two-winding transformer
trBlk = 'powerlib/Elements/Two-Winding Transformer';
tryAddBlock(trBlk, [model '/Transformer']);

% Rectifier diodes (use Diode or Diode Bridge)
diodeBlk = 'powerlib/Power Electronics/Diode';
tryAddBlock(diodeBlk, [model '/D1']);
tryAddBlock(diodeBlk, [model '/D2']);
tryAddBlock(diodeBlk, [model '/D3']);
tryAddBlock(diodeBlk, [model '/D4']);

% Load resistor on secondary (Series RLC Branch as resistive)
tryAddBlock(resBlock, [model '/Rload']);

% Voltage and current measurement blocks
vMeas = 'powerlib/Measurements/Voltage Measurement';
iMeas = 'powerlib/Measurements/Current Measurement';
tryAddBlock(vMeas, [model '/Vmeas_Vpri']);
tryAddBlock(iMeas, [model '/Imeas_Ipri']);
tryAddBlock(vMeas, [model '/Vmeas_Vout']);

% PWM Generator: use basic Pulse Generator blocks and comparators for SPWM
tryAddBlock('simulink/Sources/Sine Wave', [model '/SineRef']);
tryAddBlock('simulink/Sources/Pulse Generator', [model '/Carrier']);
tryAddBlock('simulink/Logic and Bit Operations/Compare To Zero', [model '/Compare0']);
tryAddBlock('simulink/Logic and Bit Operations/Logical Operator', [model '/NOT']);

% Scope
tryAddBlock('simulink/Sinks/Scope', [model '/Scope']);

% Arrange positions (simple layout)
set_param([model '/Vdc'], 'Position', [30 30 110 80]);
set_param([model '/C1'], 'Position', [30 130 110 200]);
set_param([model '/C2'], 'Position', [30 260 110 330]);
set_param([model '/Rbal1'], 'Position', [150 130 250 200]);
set_param([model '/Rbal2'], 'Position', [150 260 250 330]);
set_param([model '/S_high'], 'Position', [350 40 470 120]);
set_param([model '/S_low'], 'Position', [350 160 470 240]);
set_param([model '/Transformer'], 'Position', [600 60 760 240]);
set_param([model '/D1'], 'Position', [900 40 960 100]);
set_param([model '/D2'], 'Position', [900 140 960 200]);
set_param([model '/Rload'], 'Position', [1050 80 1150 160]);
set_param([model '/Scope'], 'Position', [1200 30 1350 200]);
set_param([model '/Powergui'], 'Position', [30 400 130 460]);

% Add annotations for guidance
annotationText = ['Generated model skeleton for a half-bridge converter.\n' ...
    'Please check block library paths if any blocks are missing. ' ...
    'Complete parameterization (C values, R values, transformer turns ratio, PWM logic) must be done in the model.'];
try
    add_block('built-in/Note', [model '/Note']);
    set_param([model '/Note'], 'Position', [600 300 1100 360], 'Text', annotationText);
catch
end

% Save model
save_system(model);
disp('Model skeleton created:');
disp([' - model name: ' model]);
disp('Open Simulink to inspect the model. If some blocks could not be added because of library path differences, replace them manually using the Library Browser.');

% End of script


