#1. Mostre o nome de cada filho e o nome de seu pai.
SELECT filho.nome AS filho, pai.nome AS pai 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai;

#2. Mostre o nome de cada filho e o nome de sua mãe.
SELECT filho.nome AS filho, mae.nome AS mae 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae;

#3. Mostre o nome do filho, o nome do pai e o nome da mãe.
SELECT filho.nome AS filho, pai.nome AS pai, mae.nome AS mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae;

#4. Mostre o nome do filho e a profissão de seu pai.
SELECT filho.nome AS filho, pai.profissao AS profissao_pai 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai;

#5. Mostre o nome do filho e a profissão de sua mãe.
SELECT filho.nome AS filho, mae.profissao AS profissao_mae 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae;

#6. Mostre o nome do filho, o nome do pai e o telefone do pai.
SELECT filho.nome AS filho, pai.nome AS pai, pai.telefone 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai; 

#7. Mostre o nome do filho, o nome da mãe e o telefone da mãe.
SELECT filho.nome AS filho, mae.nome AS mae, mae.telefone 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae;

#8. Mostre o nome do filho e o nome do pai, ordenando pelo nome do filho.
SELECT filho.nome AS filho, pai.nome AS pai 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
ORDER BY filho.nome; 

#9. Mostre o nome do filho e o nome da mãe, ordenando pelo nome da mãe.
SELECT filho.nome AS filho, mae.nome AS mae 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
ORDER BY mae.nome;

#10. Mostre o nome do filho, sua data de nascimento e o nome do pai.
SELECT filho.nome AS filho, filho.data_nascimento, pai.nome AS pai 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai; 

#11. Mostre o nome do filho, sua data de nascimento e o nome da mãe.
SELECT filho.nome AS filho, filho.data_nascimento, mae.nome AS mae 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae; 

#12. Mostre os filhos cujos pais tenham a profissão de Professor.
SELECT filho.nome AS filho, pai.nome AS pai, pai.profissao 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
WHERE pai.profissao = 'Professor'; 

#13. Mostre os filhos cujas mães tenham a profissão de Analista.
SELECT filho.nome AS filho, mae.nome AS mae, mae.profissao 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
WHERE mae.profissao = 'Analista'; 

#14. Mostre os filhos que nasceram depois de 01/01/2015, juntamente com o nome de seus pais.
SELECT filho.nome AS filho, filho.data_nascimento, pai.nome AS pai 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
WHERE filho.data_nascimento > '2015-01-01'; 

#15. Mostre os filhos que nasceram antes de 01/01/2010, juntamente com o nome de suas mães.
SELECT filho.nome AS filho, filho.data_nascimento, mae.nome AS mae 
FROM filho 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
WHERE filho.data_nascimento < '2010-01-01'; 

#16. Mostre filho, pai e mãe somente para os filhos cujo sexo seja F.
SELECT filho.nome AS filho, pai.nome AS pai, mae.nome AS mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
WHERE filho.sexo = 'F'; 

#17. Mostre filho, pai e mãe somente para os filhos cujo sexo seja M.
SELECT filho.nome AS filho, pai.nome AS pai, mae.nome AS mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
WHERE filho.sexo = 'M'; 

#18. Mostre o nome do filho, o nome e a profissão do pai e o nome da mãe.
SELECT filho.nome AS filho, pai.nome AS pai, 
pai.profissao AS profissao_pai, mae.nome AS mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae; 

#19. Mostre o nome do filho, nome e telefone do pai e nome e telefone da mãe.
SELECT filho.nome AS filho, pai.nome AS pai, 
pai.telefone AS telefone_pai, 
mae.nome AS mae, mae.telefone AS telefone_mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae;

#20. Mostre uma relação completa com filho, data de nascimento, pai, profissão do pai, mãe e profissão da mãe, ordenada pelo nome do filho.
SELECT filho.nome AS filho, filho.data_nascimento, 
pai.nome AS pai, pai.profissao AS profissao_pai, 
mae.nome AS mae, mae.profissao AS profissao_mae 
FROM filho 
INNER JOIN pai ON filho.id_pai = pai.id_pai 
INNER JOIN mae ON filho.id_mae = mae.id_mae 
ORDER BY filho.nome;