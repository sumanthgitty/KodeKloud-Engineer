ssh into app-server 3

![](./img/kode.PNG)

Delete the lines containing the word `copyright` in `/home/BSD.txt`, using `sed` command and save the output in `/home/BSD_DELETE.txt`

`sed '/copyright/d' /home/BSD.txt > /home/BSD_DELETE.txt`

![](./img/Kode2.PNG)

Substitue the word `and` to `for` in `/home/BSD.txt` and save the output in `/home/BSD_REPLACE.txt`

`sed 's/and/for/g' /home/BSD.txt > /home/BSD_REPLACE.txt`

![](./img/Kode3.PNG)

Submit task!

![](./img/Kode4.PNG)