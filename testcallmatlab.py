import matlab.engine
eng=matlab.engine.start_matlab()

#feed matlab function datafile name and how many freq domain samples there are
#output a binary decision vector where there's a signal or not
#i dont think we'll need the overall fft; we just want to know where there's a signal or not
val=eng.ppbin_v3("noise1kcos5kcos.txt",4)

for entry in val:
    print(entry)
