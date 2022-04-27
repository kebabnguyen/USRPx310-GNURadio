function chosenpatt = sectionchooser(freepatterns)
%given sections, choose one!
%   but what happens if there aren't any?
    %if there's no free sections, then what do?
    %in our simulated world this wouldn't happen,
    %but i think we'd just generate narrower sections (although with ofdm i
    %don't think this is an option), or just no op for a period
    %since we're simulating the entire thing then this shouldn't happen
    %def a part to improve on; just working on handling this would take a
    %big chunk of time
    %to make things work we still need to pick a pattern
    %for starters we'll pick the first one, then if time allows I'll modify
    %it to choose the one that's the least interfering
    if(any(freepatterns)) %if there's any nonzero values in freepatterns
        pattcans = nonzeros(freepatterns);
        chosenpatt = pattcans(1)-1;
    else
        chosenpatt = 0;
    end
    %matlab arrays go from 1 to n, but python stuff goes from 0 to n-1
    %bandaid fix would be to just hardcode and spit out 0
end