filename = "readingat91M1024bins.txt";
numsnaps = 4;
fftlen = 1024;
sectionlen = 32;
guardbands = 15;
occbins = ppbin_v4(filename, numsnaps, guardbands);
sections = generatesections(1024,32);
unocc = sectionscroll(occbins, sections);
chosenone = sectionchooser(unocc);