import matlab.engine
eng=matlab.engine.start_matlab()

#feed matlab function datafile name and how many freq domain samples there are
#output a binary decision vector where there's a signal or not
#i dont think we'll need the overall fft; we just want to know where there's a signal or not
chosenone = eng.executive()
print(chosenone)
