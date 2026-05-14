# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#sed -e "1070 a\        log.info(\'ORBS:%f\',naturalhist[0])" < orig/deap/gp.py > work/deap/gp.py
#sed -e "1201 a\        log.info(\'ORBS:%f\',stack[-1][1])" < orig/deap/gp.py > work/deap/gp.py
sed -e "294 a\            print 'ORBS:%f'%shift_length" < orig/deap/benchmarks/movingpeaks.py > work/deap/benchmarks/movingpeaks.py