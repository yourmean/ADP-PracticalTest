# rbind, cbind, merge

# rbind() - 위+아래
customer1= data.frame(id=c('c01', 'c02', 'c03', 'c04'),
                      last_name= c('Lee', 'Kim', 'Choi', 'Park'))
customer2= data.frame(id=c('c05', 'c06', 'c07'),
                      last_name= c('Lim', 'Bae', 'Kim'))
id_name= rbind(customer1, customer2)
id_name



# cbind() - 좌+우
age_income= data.frame(age= c(20,25,37,40,32,45,37),
                       income= c(2500, 3450, 3405, 2340, 2345, 3405, 2000))
customer= cbind(id_name, age_income)
customer



# merge()
id_number= data.frame(id= c('c03', 'c04', 'c05', 'c06', 'c07', 'c08', 'c09'),
                      number= c(3,1,0,7,3,4,1))

merge(id_name, id_number, by='id')  #inner join
merge(id_name, id_number, by='id', all=T)  #outer join
merge(id_name, id_number, by='id', all.x=T) #공통값 없을 때의 기준 - id_name
merge(id_name, id_number, by='id', all.y=T) #공통값 없을 때의 기준 - id_number