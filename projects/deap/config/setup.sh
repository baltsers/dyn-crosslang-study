# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#sed -e "1070 a\        log.info(\'ORBS:%f\',naturalhist[0])" < orig/deap/gp.py > work/deap/gp.py
#sed -e "1201 a\        log.info(\'ORBS:%f\',stack[-1][1])" < orig/deap/gp.py > work/deap/gp.py
#sed -e "183 a\        log.info(\'ORBS:%f\',end)" < orig/deap/gp.py > work/deap/gp.py
#sed -e "84 a\            log.info(\'ORBS:%f\',total)" < orig/deap/gp.py > work/deap/gp.py
#sed -e "481 a\        log.info(\'ORBS:%f\',startindex)" < orig/deap/tools/support.py > work/deap/tools/support.py
#sed -e "148 a\            log.info(\'ORBS:%f\',depth)" < orig/deap/tools/support.py > work/deap/tools/support.py
#sed -e "105 a\        log.info(\'ORBS:%f\',self.genealogy_index)" < orig/deap/tools/support.py > work/deap/tools/support.py
sed -e "481 a\            log.info(\'ORBS:%f\',nlines)" < orig/deap/tools/support.py > work/deap/tools/support.py