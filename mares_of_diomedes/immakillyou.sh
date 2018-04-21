./manger &

sleep 3

pkill -4 podargos
pkill -5 lampon
pkill -10 xanthos
pkill -11 deinos
pkill -4 yes

kill -s KILL  $(top -l 1 | grep manger | awk '{print $1}')

rm -rf *.poo

echo "NOW MY TURN!!!!!"
sleep 3
echo "3"
sleep 2
echo "2"
sleep 2
echo "1"
sleep 2

gcc horses.c -o horses
./horses &

sleep 7

kill -s KILL $(top -l 1 | grep horses | awk '{print $1}')
