function sim = readsim(filename)
%READSIM Reads simulation file and parses
    arguments (Input)
        filename
    end
    
    arguments (Output)
        sim
    end

    % Import file name from sims folder
    sims_folder = './sims';
    file_path = fullfile(sims_folder, filename);
    sim_raw = readtable(file_path, 'VariableNamingRule', 'preserve');

    % Parse given csv table data into struct
    sim.time = sim_raw.("Time (sec)");
    sim.mach = sim_raw.("Mach Number");
    sim.vel = unitconv(sim_raw.("Velocity (ft/sec)"), 'feet', 'meters');
    sim.alt = unitconv(sim_raw.("Altitude (ft)"), 'feet', 'meters');

end