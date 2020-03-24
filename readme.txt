commands
docker build -f "C:\Users\embar\source\repos\dockertraining_esteban_barron\dockertraining_esteban_barron\Dockerfile" --force-rm -t aebarron "C:\Users\embar\source\repos\dockertraining_esteban_barron" 
docker run --name Site1 -p 8085:80 6c284f084205
docker run --name Site2 -p 8086:80 -e "AppSettings:StoreName"="Plano" 6c284f084205 
