#runs to do:

#checkpoint='experimentOutputs/list/2020-03-19T12:53:04.711372/list_aic=1.0_arity=3_BO=False_CO=False_ES=1_ET=20_HR=0.5_it=1_MF=10_noConsolidation=False_pc=30.0_RS=5000_RT=3600_RR=False_RW=False_solver=python_STM=True_L=1.0_TRR=default_K=2_topkNotMAP=False_useValue=AbstractREPL.pickle'

time=300
recSteps=10000
ncores=36
salt=0

#sbatch -e listEnum${salt}.out -o listEnum${salt}.out execute_multicore.sh python bin/list.py --split 0.5 -t ${time} -RS ${recSteps} --solver 'python'  -c ${ncores} -i 2 -H 512 --resume experimentOutputs/listCathyTestEnum.pickle --singleRoundValueEval &

#sbatch -e listREPL${salt}.out -o listREPL${salt}.out execute_multicore.sh python bin/list.py --split 0.5 -t ${time} -RS ${recSteps} --solver 'python'  -c ${ncores} --useValue AbstractREPL -i 8 -H 512 --resume experimentOutputs/listCathyTestREPL.pickle --singleRoundValueEval &

sbatch -e listRNN${salt}.out -o listRNN${salt}.out execute_multicore.sh python bin/list.py --split 0.5 -t ${time} -RS ${recSteps} --solver 'python'  -c ${ncores} --useValue RNN -i 8 -H 512 --resume experimentOutputs/listCathyTestRNN.pickle --singleRoundValueEval &



# messing about:
#'experimentOutputs/listCathyTestIT=1.pickle'

#python bin/list.py --split 0.5 -t ${time} -RS ${recSteps} --solver 'python'  -c ${ncores} --useValue AbstractREPL -i 8 -H 512 --resume 'experimentOutputs/listCathyTestIT=1.pickle' --singleRoundValueEval


#one good nocompuression run for getting some candidates:
#switch to master, then use multiple cpus and run:
#nohup python bin/list.py --split 0.5 -t 1200 --solver 'ocaml' -c 20 -i 1 --no-recognition --no-consolidation &> base_run.txt &
#then cp to experimentOutputs/listBaseIT=1.pickle
