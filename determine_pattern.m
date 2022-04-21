% This function determines the subcarrier pattern currently in use by
% comparing the spectrum to the known patterns

function pattern_in_use = determine_pattern(filename)

    % Known subcarrier patterns

    sec1 = [6:10 12:22];
    sec2 = [23:24 26:31 33:38 40:41];
    sec3 = [43:52 54:59];

    % Retrieving spectrum data

    occbins = ppbin_v4(filename,4,3); % function determines which subcarriers are currently in use

    % Comparing occupied bins to known subcarrier patterns

    bool1 = occbins & sec1; % are the occupied bins consistent with pattern 1?
    bool2 = occbins & sec2; % are the occupied bins consistent with pattern 2?
    bool3 = occbins & sec3; % are the occupied bins consistent with pattern 3?

    % Summing across bools to determine which pattern most matches occupied bins

    sum1 = sum(bool1);
    sum2 = sum(bool2);
    sum3 = sum(bool3);

    % Selecting pattern

    if (sum1 >= sum2) % pattern 1 more likely than pattern 2
        if (sum1 >= sum3) % and pattern 1 more likely than pattern 3
            pattern_in_use = 0; % pattern 1 more likely than patterns 2 or 3
        end
    elseif (sum2 >= sum1) % pattern 2 more likely than pattern 1
        if (sum2 >= sum3) % and pattern 2 more likely than pattern 3
            pattern_in_use = 1; % pattern 2 more likely than patterns 1 or 3
        end
    else
        pattern_in_use = 2; % not pattern 1 or 2 then must be 3
    end

end