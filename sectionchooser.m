function chosensect = sectionchooser(freesections)
%given sections, choose one!
%   but what happens if there aren't any?
if(isempty(freesections))
    %if there's no free sections, then what do?
    %in our simulated world this wouldn't happen,
    %but i think we'd just generate narrower sections (although with ofdm i
    %don't think this is an option), or just no op for a period
else
    chosensect = freesections(1,:)
end
end