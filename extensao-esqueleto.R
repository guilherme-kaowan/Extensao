# Script para leitura de bancos de dados diversos para geração de um data frame de uma única linha referente as informações do estado do aluno

# Ao receber este script esqueleto colocá-lo no repositório LOCAL Extensao, que deve ter sido clonado do GitHub
# Enviar o script esqueleto para o repositório REMOTO com o nome extensao-esqueleto.R

# Para realizar as tarefas da ETAPA 1, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela
# Após os alunos concluírem a ETAPA 1 a professora orientará fazer o merge into main e depois abrir outro branch. Aguarde...


####################################
# ETAPA 1: BANCO DE DADOS DO SINASC
####################################

# A ALTERAÇÃO DO SCRIPT ESQUELETO - ETAPA 1 - DEVERÁ SER FEITA DENTRO DA BRANCH SINASC

# Tarefa 1. Leitura do banco de dados do SINASC 2015  com 3017668 linhas e 61 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sinasc
dados_sinasc = read.csv("SINASC_2015.csv", header = TRUE, sep = ";")
str(dados_sinasc)
head(dados_sinasc)

# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61
# nomes das respectivas variáveis: CONTADOR, CODMUNNASC, LOCNASC, IDADEMAE, ESTCIVMAE, CODMUNRES, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, PESO, IDANOMAL, ESCMAE2010, RACACORMAE, SEMAGESTAC, CONSPRENAT, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
dados_sinasc_1 <- dados_sinasc[, c(1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61)]
# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 
dados_sinasc_2 <- dados_sinasc_1[substr(dados_sinasc_1$CODMUNRES, 1, 2) == "17", ]

# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 27918     12: 16980     13: 80097     14: 11409     15: 143657    16: 15750      17: 25110
# 21: 117564    22: 49253     23: 132516    24: 49099     25: 59089     26: 145024     27: 52257     28: 34917     29: 206655
# 31: 268305    32: 56941     33: 236960    35: 634026     
# 41: 160947    42: 97223     43: 148359
# 50: 44142     51: 56673     52: 100672    53: 46122 

# Exportar o arquivo com o nome dados_sinasc_2.csv
write.csv(dados_sinasc_2, "dados_sinasc_2.csv", row.names = FALSE)
# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC, ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, IDANOMAL, ESCMAE2010, RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK
LOCNASC = table(dados_sinasc_2$LOCNASC) # nao informado com 9
ESTCIVMAE = table(dados_sinasc_2$ESTCIVMAE) # nao informado com 9
GESTACAO = table(dados_sinasc_2$GESTACAO) # nao informado com 9
GRAVIDEZ = table(dados_sinasc_2$GRAVIDEZ) # nao informado com 9
PARTO = table(dados_sinasc_2$PARTO) # nao informado com 9
SEXO =  table(dados_sinasc_2$SEXO) # nao informado com 0
APGAR5 = table(dados_sinasc_2$APGAR5) # nao informado com 99
RACACOR = table(dados_sinasc_2$RACACOR)
IDANOMAL = table(dados_sinasc_2$IDANOMAL) # nao informado com 9
ESCMAE2010 = table(dados_sinasc_2$ESCMAE2010)# nao informado com 9
RACACORMAE = table(dados_sinasc_2$RACACORMAE)
TPAPRESENT = table(dados_sinasc_2$TPAPRESENT) # nao informado com 9
TPROBSON = table(dados_sinasc_2$TPROBSON) # nao informado com 11
PARIDADE = table(dados_sinasc_2$PARIDADE)
KOTELCHUCK = table(dados_sinasc_2$KOTELCHUCK) # nao informado com 9
unique(dados_sinasc_2$IDADEMAE)
unique(dados_sinasc_2$CONSPRENAT)
unique(dados_sinasc_2$SEMAGESTAC)
unique(dados_sinasc_2$APGAR5)
unique(dados_sinasc_2$PESO)
# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado"   TPROBSON = 11 significa "não classificado por falta de informação"
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
dados_sinasc_2$LOCNASC[dados_sinasc_2$LOCNASC == 9] = NA
dados_sinasc_2$IDADEMAE[dados_sinasc_2$IDADEMAE == 99] = NA
dados_sinasc_2$ESTCIVMAE[dados_sinasc_2$ESTCIVMAE == 9] = NA
dados_sinasc_2$GESTACAO[dados_sinasc_2$GESTACAO == 9] = NA
dados_sinasc_2$GRAVIDEZ[dados_sinasc_2$GRAVIDEZ == 9] = NA
dados_sinasc_2$PARTO[dados_sinasc_2$PARTO == 9] = NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 0] = NA
dados_sinasc_2$APGAR5[dados_sinasc_2$APGAR5 == 99] = NA
dados_sinasc_2$PESO[dados_sinasc_2$PESO == 9999] = NA
dados_sinasc_2$IDANOMAL[dados_sinasc_2$IDANOMAL == 9] = NA
dados_sinasc_2$ESCMAE2010[dados_sinasc_2$ESCMAE2010 == 9] = NA
dados_sinasc_2$CONSPRENAT[dados_sinasc_2$CONSPRENAT == 99] = NA
dados_sinasc_2$TPAPRESENT[dados_sinasc_2$TPAPRESENT == 9] = NA
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 11] = NA
dados_sinasc_2$KOTELCHUCK[dados_sinasc_2$KOTELCHUCK == 9] = NA
# Tarefa 6. Atribuir legendas para as categorias das variáveis investigadas na etapa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), 
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",  
# "Mais que adequado")

# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados

dados_sinasc_2$LOCNASC = factor(dados_sinasc_2$LOCNASC, levels = c(1, 2, 3, 4, 5),
  labels = c("Hospital", "Outros estabelecimentos de saúde", "Domicílio", "Outros", "Aldeia indígena"))
dados_sinasc_2$ESTCIVMAE = factor(dados_sinasc_2$ESTCIVMAE, levels = c(1, 2, 3, 4, 5),
  labels = c("Solteira", "Casada", "Viúva", "Separada judicialmente/divorciada", "União estável"))
dados_sinasc_2$GESTACAO = factor(dados_sinasc_2$GESTACAO, levels = c(1, 2, 3, 4, 5, 6),
  labels = c("Menos de 22 semanas", "22 a 27 semanas", "28 a 31 semanas", "32 a 36 semanas", "37 a 41 semanas", "42 semanas e mais"))
dados_sinasc_2$GRAVIDEZ = factor(dados_sinasc_2$GRAVIDEZ, levels = c(1, 2, 3),
  labels = c("Única", "Dupla", "Tripla ou mais"))
dados_sinasc_2$PARTO = factor(dados_sinasc_2$PARTO, levels = c(1, 2),
  labels = c("Vaginal", "Cesário"))
dados_sinasc_2$SEXO = factor(dados_sinasc_2$SEXO, levels = c(1, 2),
  labels = c("Masculino", "Feminino"))
dados_sinasc_2$RACACOR = factor(dados_sinasc_2$RACACOR, levels = c(1, 2, 3, 4, 5),
  labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$IDANOMAL = factor(dados_sinasc_2$IDANOMAL, levels = c(1, 2),
  labels = c("Sim", "Não"))
dados_sinasc_2$ESCMAE2010 = factor(dados_sinasc_2$ESCMAE2010, levels = c(0, 1, 2, 3, 4, 5),
  labels = c("Sem escolaridade", "Fundamental I (1ª a 4ª série)", "Fundamental II (5ª a 8ª série)", "Médio (antigo 2º grau)", "Superior incompleto", "Superior completo"))
dados_sinasc_2$RACACORMAE = factor(dados_sinasc_2$RACACORMAE, levels = c(1, 2, 3, 4, 5),
  labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$TPAPRESENT = factor(dados_sinasc_2$TPAPRESENT, levels = c(1, 2, 3),
  labels = c("Cefálica", "Pélvica ou podálica", "Transversa"))
dados_sinasc_2$PARIDADE = factor(dados_sinasc_2$PARIDADE, levels = c(0, 1),
  labels = c("Nulípara", "Multípara"))
dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1, 2, 3, 4, 5),
  labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado", "Mais que adequado"))

# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5
# nova variável: dados_sinasc_2$F_PESO com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50+
# nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
# Atenção para casos de NA em IDADEMAE, PESO e APGAR5
# Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator
install.packages("dplyr")
library(dplyr)
dados_sinasc_2 <- dados_sinasc_2 %>%mutate(F_PESO = case_when(PESO < 2500 ~ "Baixo peso",
  PESO >= 2500 & PESO < 4000 ~ "Peso normal",PESO >= 4000 ~ "Macrossomia"),
  F_APGAR5 = case_when(APGAR5 < 7 ~ "Baixo",APGAR5 >= 7 ~ "Normal"),
  F_IDADE = case_when(IDADEMAE < 15 ~ "<15",
  IDADEMAE >= 15 & IDADEMAE <= 19 ~ "15-19",IDADEMAE >= 20 & IDADEMAE <= 24 ~ "20-24",IDADEMAE >= 25 & IDADEMAE <= 29 ~ "25-29",IDADEMAE >= 30 & IDADEMAE <= 34 ~ "30-34",
  IDADEMAE >= 35 & IDADEMAE <= 39 ~ "35-39",IDADEMAE >= 40 & IDADEMAE <= 44 ~ "40-44",IDADEMAE >= 45 & IDADEMAE <= 49 ~ "45-49",IDADEMAE >= 50 ~ "50+"))
dados_sinasc_2$ESTCIV = ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Solteira", "Viúva", "Separada judicialmente/divorciada"), "Sem companheiro",
                               ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Casada", "União estável"), "Com companheiro", NA))
dados_sinasc_2$PERIG = ifelse(is.na(dados_sinasc_2$CODMUNNASC) | is.na(dados_sinasc_2$CODMUNRES), NA,
                              ifelse(dados_sinasc_2$CODMUNNASC == dados_sinasc_2$CODMUNRES, "Não", "Sim"))
dados_sinasc_2$PERIG = factor(dados_sinasc_2$PERIG, levels = c("Não", "Sim"))
dados_sinasc_2$ESTCIV = factor(dados_sinasc_2$ESTCIV, levels = c("Sem companheiro","Com companheiro"))
dados_sinasc_2$F_PESO = as.factor(dados_sinasc_2$F_PESO)
dados_sinasc_2$F_APGAR5 = as.factor(dados_sinasc_2$F_APGAR5)
dados_sinasc_2$F_IDADE = as.factor(dados_sinasc_2$F_IDADE)

# Tarefa 8. Agregar ao banco de dados_sinasc_2 as informações PESO_P10 e PESO_P90 a partir de Tabela_PIG_Brasil.csv
# a Tabela PIG informa P10 e P90 dos pesos, de acordo com a idade gestacional
# criar nova variável referente ao peso, de acordo com a idade gestacional, conforme indicado abaixo
# nova variável apenas para casos de GRAVIDEZ única: dados_sinasc_2$F_PIG: PIG: PESO < PESO_P10, AIG: PESO_P10 <= PESO <= PESO_P90, GIG: PESO > PESO_P90
# Atenção para casos de NA em SEMAGESTAC, PESO ou SEXO. Lembre-se também que em dados_sinasc_2 SEXO está como fator com as categorias Feminino e Masculino.

# criar nova variável referente ao deslocamento materno para realizar o parto, chamado de peregrinação
# nova variável: dados_sinasc_2$PERIG: Não: CODMUNNASC igual a CODMUNRES, Sim: CODMUNNASC diferente de CODMUNRES
install.packages("readr")
library(readr)
tabela_pig = read.csv("Tabela_PIG_Brasil.csv", header =  TRUE, sep = ";")
tabela_pig$SEXO = factor(tabela_pig$SEXO, levels = c("Masculino", "Feminino"))
dados_sinasc_2 = merge(dados_sinasc_2,tabela_pig , by=c("SEMAGESTAC","SEXO"), all.x = TRUE) 
dados_sinasc_2$F_PIG=ifelse(dados_sinasc_2$GRAVIDEZ != "Única", NA,
                            ifelse(is.na(dados_sinasc_2$PESO)|is.na(dados_sinasc_2$PESO_P10)|is.na(dados_sinasc_2$PESO_P90),NA,
                            ifelse(dados_sinasc_2$PESO < dados_sinasc_2$PESO_P10, "PIG",
                            ifelse(dados_sinasc_2$PESO<=dados_sinasc_2$PESO_P90, "AIG", "GIG"))))
dados_sinasc_2$F_PIG = factor(dados_sinasc_2$F_PIG, levels = c("PIG","AIG","GIG"))
dados_sinasc_2$TRPIG_P = ifelse(!is.na(dados_sinasc_2$F_PIG) & dados_sinasc_2$F_PIG == "PIG", 1, 0)
dados_sinasc_2$TRPIG_A = ifelse(!is.na(dados_sinasc_2$F_PIG) & dados_sinasc_2$F_PIG == "AIG", 1, 0)
dados_sinasc_2$TRPIG_G = ifelse(!is.na(dados_sinasc_2$F_PIG) & dados_sinasc_2$F_PIG == "GIG", 1, 0)
# Tarefa 9 e 10 (Reformulada)
# Base inicial

dados_uf = dados_sinasc_2
dados_uf$CODMUNRES = "17" 
dados_sinasc_2 = rbind(dados_sinasc_2, dados_uf)

base = data.frame(CODMUNRES = sort(unique(dados_sinasc_2$CODMUNRES)))

# TN
TN = as.data.frame(table(factor(dados_sinasc_2$CODMUNRES, levels = base$CODMUNRES)))
names(TN) = c("CODMUNRES", "TN")
base = merge(base, TN, by = "CODMUNRES", all.x = TRUE)

# TNRC
dados_UF = dados_sinasc[substr(as.character(dados_sinasc$CODMUNRES), 1, 2) == "17", ]
dados_UF_comp = dados_UF[complete.cases(dados_UF), ]
TNRC = as.data.frame(table(factor(dados_UF_comp$CODMUNRES, levels = base$CODMUNRES)))
names(TNRC) = c("CODMUNRES", "TNRC")
base = merge(base, TNRC, by = "CODMUNRES", all.x = TRUE)

# TNRCR
dados_TO_completos = dados_sinasc_2[complete.cases(dados_sinasc_2), ]
TNRCR = as.data.frame(table(factor(dados_TO_completos$CODMUNRES, levels = base$CODMUNRES)))
names(TNRCR) = c("CODMUNRES", "TNRCR")
base = merge(base, TNRCR, by = "CODMUNRES", all.x = TRUE)

# TGI
tab_idade = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$F_IDADE, 
                                                   levels = c("<15","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50+")))
df_idade = as.data.frame.matrix(tab_idade)
names(df_idade) = c("TGI_15", "TGI_15_19", "TGI_20_24", "TGI_25_29", "TGI_30_34", "TGI_35_39", "TGI_40_44", "TGI_45_49", "TGI_50")
df_idade$CODMUNRES = rownames(df_idade)
base = merge(base, df_idade, by = "CODMUNRES", all.x = TRUE)

# TGIF
base$TGIF = rowSums(base[, c("TGI_15_19", "TGI_20_24", "TGI_25_29", "TGI_30_34", "TGI_35_39", "TGI_40_44", "TGI_45_49")])

# Percentis
p_idade = aggregate(IDADEMAE ~ CODMUNRES, dados_sinasc_2, function(x) quantile(x, probs = c(0.25, 0.5, 0.75), na.rm = TRUE))
p_idade = do.call(data.frame, p_idade)
names(p_idade) = c("CODMUNRES", "IM_P25", "IM_P50", "IM_P75")
p_idade[, 2:4] = round(p_idade[, 2:4], 2)
base = merge(base, p_idade, by = "CODMUNRES", all.x = TRUE)

# IM_MD
media_idade = aggregate(IDADEMAE ~ CODMUNRES, dados_sinasc_2, mean, na.rm = TRUE)
media_idade$IDADEMAE = round(media_idade$IDADEMAE, 2)
names(media_idade)[2] = "IM_MD"
base = merge(base, media_idade, by = "CODMUNRES", all.x = TRUE)

# IM_DP
dp_idade = aggregate(IDADEMAE ~ CODMUNRES, dados_sinasc_2, sd, na.rm = TRUE)
dp_idade$IDADEMAE = round(dp_idade$IDADEMAE, 2)
names(dp_idade)[2] = "IM_DP"
base = merge(base, dp_idade, by = "CODMUNRES", all.x = TRUE)

#  ESCOLARIDADE DA MÃE
tab_esc = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$ESCMAE2010, 
                levels = c("Sem escolaridade", "Fundamental I", "Fundamental II", "Médio", "Superior incompleto", "Superior completo")))
df_esc = as.data.frame.matrix(tab_esc)
names(df_esc) = c("EM_S", "EM_FI", "EM_FII", "EM_M", "EM_SI", "EM_SC")
df_esc$CODMUNRES = rownames(df_esc)
base = merge(base, df_esc, by = "CODMUNRES", all.x = TRUE)

# RAÇA/COR DA MÃE
tab_raca = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$RACACORMAE, levels = c("Branca", "Preta", "Amarela", "Parda", "Indígena")))
df_raca = as.data.frame.matrix(tab_raca)
names(df_raca) = c("TGRC_B", "TGRC_PT", "TGRC_A", "TGRC_PD", "TGRC_I")
df_raca$CODMUNRES = rownames(df_raca)
base = merge(base, df_raca, by = "CODMUNRES", all.x = TRUE)

# COMPANHEIRO 
tab_est = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$ESTCIV, levels = c("Sem companheiro", "Com companheiro")))
df_est = as.data.frame.matrix(tab_est)
names(df_est) = c("TGSC", "TGCC") 
df_est$CODMUNRES = rownames(df_est)
base = merge(base, df_est, by = "CODMUNRES", all.x = TRUE)

# PARIDADE
tab_par = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$PARIDADE, levels = c("Nulípara", "Primípara", "Multípara")))
df_par = as.data.frame.matrix(tab_par)

# TGPRI (Primípara)
base$TGPRI = df_par[, "Nulípara"] 

# TGNPRI (Não primípara)
base$TGNPRI = df_par[, "Primípara"] + df_par[, "Multípara"]

# TIPO DE GRAVIDEZ
tab_grav = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$GRAVIDEZ, levels = c("Única", "Dupla", "Tripla e mais")))
df_grav = as.data.frame.matrix(tab_grav)

base$TGU = df_grav[, "Única"]
base$TGG = df_grav[, "Dupla"] + df_grav[, "Tripla e mais"] 

# DURAÇÃO DA GESTAÇÃO
tab_gest = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$GESTACAO, levels = c("Menos de 22 semanas", "22 a 27 semanas", "28 a 31 semanas", "32 a 36 semanas", "37 a 41 semanas", "42 semanas e mais")))
df_gest = as.data.frame.matrix(tab_gest)
names(df_gest) = c("TGD_22", "TGD_22_27", "TGD_28_31", "TGD_32_36", "TGD_37_41", "TGD_42")
df_gest$CODMUNRES = rownames(df_gest)
base = merge(base, df_gest, by = "CODMUNRES", all.x = TRUE)
base$TGD_PRT = base$TGD_22 + base$TGD_22_27 + base$TGD_28_31 + base$TGD_32_36
base$TGD_AT = base$TGD_37_41
base$TGD_PST = base$TGD_42

# DURAÇÃO DA GESTAÇÃO
p_gest = aggregate(SEMAGESTAC ~ CODMUNRES, dados_sinasc_2, function(x) quantile(x, probs = c(0.25, 0.5, 0.75), na.rm = TRUE))
p_gest = do.call(data.frame, p_gest)
names(p_gest) = c("CODMUNRES", "DG_P25", "DG_P50", "DG_P75")
p_gest[, 2:4] = round(p_gest[, 2:4], 2)
base = merge(base, p_gest, by = "CODMUNRES", all.x = TRUE)

media_gest = aggregate(SEMAGESTAC ~ CODMUNRES, dados_sinasc_2, mean, na.rm = TRUE)
media_gest$SEMAGESTAC = round(media_gest$SEMAGESTAC, 2)
names(media_gest)[2] = "DG_MD"
base = merge(base, media_gest, by = "CODMUNRES", all.x = TRUE)

dp_gest = aggregate(SEMAGESTAC ~ CODMUNRES, dados_sinasc_2, sd, na.rm = TRUE)
dp_gest$SEMAGESTAC = round(dp_gest$SEMAGESTAC, 2)
names(dp_gest)[2] = "DG_DP"
base = merge(base, dp_gest, by = "CODMUNRES", all.x = TRUE)

# KOTELCHUCK
tab_kotel = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$KOTELCHUCK, levels = c("Não realizado", "Inadequado", "Intermediário", "Adequado", "Mais que adequado")))
df_kotel = as.data.frame.matrix(tab_kotel)
names(df_kotel) = c("TKC_NR", "TKC_ID", "TKC_IT", "TKC_AD", "TKC_MAD")
df_kotel$CODMUNRES = rownames(df_kotel)
base = merge(base, df_kotel, by = "CODMUNRES", all.x = TRUE)

# PEREGRINAÇÃO 
tab_perig = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$PERIG, levels = c("Sim", "Não")))
df_perig = as.data.frame.matrix(tab_perig)
names(df_perig) = c("TGPRG_S", "TGPRG_N")
df_perig$CODMUNRES = rownames(df_perig)
base = merge(base, df_perig, by = "CODMUNRES", all.x = TRUE)

# TIPO DE PARTO 
tab_parto = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$PARTO, levels = c("Vaginal", "Cesáreo")))
df_parto = as.data.frame.matrix(tab_parto)
names(df_parto) = c("TPV", "TPC")
df_parto$CODMUNRES = rownames(df_parto)
base = merge(base, df_parto, by = "CODMUNRES", all.x = TRUE)

# POSIÇÃO DA APRESENTAÇÃO
tab_apres = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$TPAPRESENT, levels = c("Cefálica", "Pélvica ou podálica", "Transversa")))
df_apres = as.data.frame.matrix(tab_apres)
names(df_apres) = c("TRAP_C", "TRAP_P", "TRAP_T")
df_apres$CODMUNRES = rownames(df_apres)
base = merge(base, df_apres, by = "CODMUNRES", all.x = TRUE)

# GRUPOS DE ROBSON
tab_robson = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$TPROBSON, levels = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")))
df_robson = as.data.frame.matrix(tab_robson)
names(df_robson) = c("TGROB_1", "TGROB_2", "TGROB_3", "TGROB_4", "TGROB_5", "TGROB_6", "TGROB_7", "TGROB_8", "TGROB_9", "TGROB_10")
df_robson$CODMUNRES = rownames(df_robson)
base = merge(base, df_robson, by = "CODMUNRES", all.x = TRUE)

# LOCAL DE NASCIMENTO
tab_loc = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$LOCNASC, levels = c("1", "2", "3", "4", "5")))
df_loc = as.data.frame.matrix(tab_loc)
names(df_loc) = c("TNLOC_H", "TNLOC_ES", "TNLOC_D", "TNLOC_O", "TNLOC_AI")
df_loc$CODMUNRES = rownames(df_loc)
base = merge(base, df_loc, by = "CODMUNRES", all.x = TRUE)

# SEXO 
tab_sexo = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$SEXO, levels = c("Masculino", "Feminino")))
df_sexo = as.data.frame.matrix(tab_sexo)
names(df_sexo) = c("TRS_M", "TRS_F")
df_sexo$CODMUNRES = rownames(df_sexo)
base = merge(base, df_sexo, by = "CODMUNRES", all.x = TRUE)

# RAÇA/COR DO BEBÊ
tab_raca_b = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$RACACOR, levels = c("1", "2", "3", "4", "5")))
df_raca_b = as.data.frame.matrix(tab_raca_b)
names(df_raca_b) = c("TRRC_B", "TRRC_PT", "TRRC_A", "TRRC_PD", "TRRC_I")
df_raca_b$CODMUNRES = rownames(df_raca_b)
base = merge(base, df_raca_b, by = "CODMUNRES", all.x = TRUE)

# PESO CATEGORIAS
tab_peso_c = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$F_PESO, levels = c("Baixo peso", "Peso normal", "Macrossomia")))
df_peso_c = as.data.frame.matrix(tab_peso_c)
names(df_peso_c) = c("TRP_BP", "TRP_N", "TRP_M")
df_peso_c$CODMUNRES = rownames(df_peso_c)
base = merge(base, df_peso_c, by = "CODMUNRES", all.x = TRUE)

# PESO CONTÍNUO
p_peso = aggregate(PESO ~ CODMUNRES, dados_sinasc_2, function(x) quantile(x, probs = c(0.25, 0.5, 0.75), na.rm = TRUE))
p_peso = do.call(data.frame, p_peso)
names(p_peso) = c("CODMUNRES", "PESO_P25", "PESO_P50", "PESO_P75")
p_peso[, 2:4] = round(p_peso[, 2:4], 2)
base = merge(base, p_peso, by = "CODMUNRES", all.x = TRUE)

media_peso = aggregate(PESO ~ CODMUNRES, dados_sinasc_2, mean, na.rm = TRUE)
media_peso$PESO = round(media_peso$PESO, 2)
names(media_peso)[2] = "PESO_MD"
base = merge(base, media_peso, by = "CODMUNRES", all.x = TRUE)

dp_peso = aggregate(PESO ~ CODMUNRES, dados_sinasc_2, sd, na.rm = TRUE)
dp_peso$PESO = round(dp_peso$PESO, 2)
names(dp_peso)[2] = "PESO_DP"
base = merge(base, dp_peso, by = "CODMUNRES", all.x = TRUE)

# PIG, AIG, GIG
base = merge(base, aggregate(TRPIG_P ~ CODMUNRES, dados_sinasc_2, sum, na.rm=T), by="CODMUNRES", all.x=T)
base = merge(base, aggregate(TRPIG_A ~ CODMUNRES, dados_sinasc_2, sum, na.rm=T), by="CODMUNRES", all.x=T)
base = merge(base, aggregate(TRPIG_G ~ CODMUNRES, dados_sinasc_2, sum, na.rm=T), by="CODMUNRES", all.x=T)

# APGAR5
tab_apgar = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$F_APGAR5, levels = c("Baixo", "Normal")))
df_apgar = as.data.frame.matrix(tab_apgar)
names(df_apgar) = c("TRAPG5_B", "TRAPG5_N")
df_apgar$CODMUNRES = rownames(df_apgar)
base = merge(base, df_apgar, by = "CODMUNRES", all.x = TRUE)

# APGAR5  
media_apgar = aggregate(APGAR5 ~ CODMUNRES, dados_sinasc_2, mean, na.rm = TRUE)
media_apgar$APGAR5 = round(media_apgar$APGAR5, 2)
names(media_apgar)[2] = "APG5_MD"
base = merge(base, media_apgar, by = "CODMUNRES", all.x = TRUE)

dp_apgar = aggregate(APGAR5 ~ CODMUNRES, dados_sinasc_2, sd, na.rm = TRUE)
dp_apgar$APGAR5 = round(dp_apgar$APGAR5, 2)
names(dp_apgar)[2] = "APG5_DP"
base = merge(base, dp_apgar, by = "CODMUNRES", all.x = TRUE)

# ANOMALIA CONGÊNITA
tab_anom = table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$IDANOMAL, levels = c("Sim", "Não")))
df_anom = as.data.frame.matrix(tab_anom)
names(df_anom) = c("TRAC", "TRSAC") 
df_anom$CODMUNRES = rownames(df_anom)
base = merge(base, df_anom, by = "CODMUNRES", all.x = TRUE)

# Arrumando
base$ANO = "2015"
base$NIVEL = "MUNICIPIO"
base$NIVEL[base$CODMUNRES == "17"] = "UF"
linha_total = base[base$CODMUNRES == "17", ]
linhas_municipios = base[base$CODMUNRES != "17", ]
base_final = rbind(linha_total, linhas_municipios)

# Organizando colunas
colunas_ordenadas = c("ANO", "NIVEL", "CODMUNRES", setdiff(names(base_final), c("ANO", "NIVEL", "CODMUNRES")))
base_final = base_final[, colunas_ordenadas]


# Tarefa 11: Exporte o banco de dados com o nome SINASC_UF.csv
write.csv(base_final, "SINASC_TO.csv", row.names = FALSE)

# Ao terminar a ETAPA 1 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 1"



##################################
# ETAPA 2: BANCO DE DADOS DO SIM
##################################
# Só inicie esta Etapa quando a professora orientar
# Altere o script esqueleto nas partes que se refere a ETAPA 2 e envie para o repositório Extensao tendo feito o commite "Esqueleto atualizado na Etapa 2"
# A partir de main crie a branch SIM
# ESTANDO NA BRANCH SIM, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 1 e só insira comandos na ETAPA 2
# Para realizar as tarefas da ETAPA 2, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela

# Tarefa 1. Leitura do banco de dados Mortalidade_Geral_2015 do SIM 2015 com 1216475 linhas e 87 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sim
dados_sim = read.csv('Mortalidade_Geral_2015.csv', header = TRUE, sep = ';')

# Tarefa 2. Reduzir dados_sim apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sim_1
# as colunas serão: 1, 3, 4, 8, 9, 10, 11, 14, 17, 35, 36, 37, 47, 77, 84
# nomes das respectivas variáveis: CONTADOR, TIPOBITO, DTOBITO, DTNASC, IDADE, SEXO, RACACOR, ESC2010, CODMUNRES, TPMORTEOCO, 
# OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO
dados_sim_1 = dados_sim[, c(1, 3, 4, 8, 9, 10, 11, 14, 17, 35, 36, 37, 47, 77, 84)]

# Tarefa 3. Reduzir dados_sim_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sim_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 
dados_sim_2 <- dados_sim_1[substr(dados_sim_1$CODMUNRES, 1, 2) == "17", ]

# observar abaixo o número de óbitos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 7948      12: 3517      13: 16675     14: 2091      15: 37365     16: 2946       17: 7402
# 21: 33666     22: 19366     23: 55258     24: 20153     25: 26422     26: 62556      27: 19756     28: 13453     29: 87083
# 31: 131274    32: 22332     33: 127714    35: 287645     
# 41: 70839     42: 37984     43: 82349
# 50: 15457     51: 17095     52: 38854     53: 11975

# Exportar o arquivo com o nome dados_sim_2.csv
write.csv(dados_sim_2, "dados_sim_2.csv", row.names = FALSE)


# Ao concluir a Tarefa 3 da Etapa 2 commite e envie para o repositório REMOTO o script e dados_sim_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sim_2 a frequência das categorias das seguintes variáveis: TIPOBITO, SEXO, RACACOR, 
# TPMORTEOCO, OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO
TIPOBITO = table(dados_sim_2$TIPOBITO)
SEXO = table(dados_sim_2$SEXO) # NAO INFORMADO É 0
RACACOR = table(dados_sim_2$RACACOR)
TPMORTEOCO = table(dados_sim_2$TPMORTEOCO) # NAO INFORMADO É 9
OBITOGRAV = table(dados_sim_2$OBITOGRAV) # NAO INFORMADO É 9
OBITOPUERP = table(dados_sim_2$OBITOPUERP) # NAO INFORMADO É 9
CAUSABAS = table(dados_sim_2$CAUSABAS)
TPOBITOCOR = table(dados_sim_2$TPOBITOCOR)
MORTEPARTO = table(dados_sim_2$MORTEPARTO) # NAO INFORMADO É 9
unique(dados_sim_2$IDADE) # NAO INFORMADO É 999
unique(dados_sim_2$DTOBITO)
unique(dados_sim_2$DTNASC)



# Tarefa 5. Atribuir para cada variável de dados_sim_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# veja o dicionário do SIM para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADE verificar se existem valores como 99 para NA
dados_sim_2$SEXO[dados_sim_2$SEXO == 0] = NA
dados_sim_2$TPMORTEOCO[dados_sim_2$TPMORTEOCO == 9] = NA
dados_sim_2$OBITOGRAV[dados_sim_2$OBITOGRAV == 9] = NA
dados_sim_2$OBITOPUERP[dados_sim_2$OBITOPUERP == 9] = NA
dados_sim_2$MORTEPARTO[dados_sim_2$MORTEPARTO == 9] = NA
dados_sim_2$IDADE[dados_sim_2$IDADE == 999] = NA


# Tarefa 6. Atribuir legendas para as categorias das variáveis qualitativas investigadas na tarefa 4.
# Exemplo: dados_sim_2$TIPOBITO = factor(dados_sim_2$TIPOBITO, levels = c(1,2), 
# labels = c("Fetal", "Não fetal")

# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados
dados_sim_2$TIPOBITO = factor(dados_sim_2$TIPOBITO, 
                              levels = c(1, 2), 
                              labels = c("Fetal", "Não fetal"))
dados_sim_2$SEXO = factor(dados_sim_2$SEXO, 
                          levels = c(1, 2), 
                          labels = c("Masculino", "Feminino"))
dados_sim_2$RACACOR = factor(dados_sim_2$RACACOR, 
                             levels = c(1, 2, 3, 4, 5), 
                             labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sim_2$TPMORTEOCO = factor(dados_sim_2$TPMORTEOCO, 
                                levels = c(1, 2, 3, 4, 5, 8), 
                                labels = c("Na gravidez", "No parto", "No abortamento", 
                                           "Até 42 dias após o término do parto", "De 43 dias a 1 ano após o termino da gestação", 
                                           "Não ocorreu nestes períodos"))
dados_sim_2$OBITOGRAV = factor(dados_sim_2$OBITOGRAV, 
                               levels = c(1, 2), 
                               labels = c("Sim", "Não"))
dados_sim_2$OBITOPUERP = factor(dados_sim_2$OBITOPUERP, 
                                levels = c(1, 2, 3), 
                                labels = c("Sim, até 42 dias após o parto", "Sim, de 43 dias a 1 ano", "Não"))
dados_sim_2$TPOBITOCOR = factor(dados_sim_2$TPOBITOCOR, 
                                levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
                                labels = c("Durante a gestação", "Durante o abortamento", "Após o abortamento", 
                                           "No parto ate 1 hora após o parto", "No puerpério - até 42 dias após o parto", 
                                           "Entre 43 dias e até 1 ano após o parto", "A investigação não identificou o momento do óbito", 
                                           "Mais de um ano após o parto", " O óbito não ocorreu nas circuntancias anteriores "))
dados_sim_2$MORTEPARTO = factor(dados_sim_2$MORTEPARTO, 
                                levels = c(1, 2 , 3), 
                                labels = c("Antes", "Durante", "Após"))

# Tarefa 7. Crie um banco de dados, de nome SIM_UF.csv (Exemplo: SIM_RJ.csv), contendo as 41 variáveis listadas no arquivo “Variáveis - Projeto - Tarefa 7 da Etapa 2.pdf”
# Atenção:
# 1. Para informações gerais utilize CAUSABAS, SEXO e IDADE
# 2. Para informações fetais utilize TIPOBITO
# 3. Para informações neonatais utilize TIPOBITO não fetal e IDADE entre 0 e 27 dias e RACACOR
# 4. Para informações maternas utilize TPMORTEOCO, ESC e IDADE
dados_uf = dados_sim_2
dados_uf$CODMUNRES = "17"
dados_sim_2 = rbind(dados_sim_2, dados_uf)
basesim = data.frame(CODMUNRES = sort(unique(dados_sim_2$CODMUNRES)))
basesim$ANO = 2015
basesim$NIVEL = ifelse(basesim$CODMUNRES == "17", "UF", "MUNICIPIO")
# TO
TO = as.data.frame(table(factor(dados_sim_2$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO) = c("CODMUNRES", "TO")
basesim = merge(basesim, TO, by = "CODMUNRES", all.x = TRUE)
# TORC
dados_UF = dados_sim_2[substr(as.character(dados_sim_2$CODMUNRES), 1, 2) == "17", ]
dados_UF_comp = dados_UF[complete.cases(dados_UF), ]
TORC = as.data.frame(table(factor(dados_UF_comp$CODMUNRES, levels = basesim$CODMUNRES)))
names(TORC) = c("CODMUNRES", "TORC")
basesim = merge(basesim, TORC, by = "CODMUNRES", all.x = TRUE)

# TORCR
vars_14 = c("TIPOBITO", "DTOBITO", "DTNASC", "IDADE", "SEXO", "RACACOR", 
            "ESC2010", "CODMUNRES", "TPMORTEOCO", "OBITOGRAV", "OBITOPUERP", 
            "CAUSABAS", "TPOBITOCOR", "MORTEPARTO")
dados_sim_14 = dados_sim_2[, vars_14]
dados_TO_completos = dados_sim_14[complete.cases(dados_sim_14), ]
TORCR = as.data.frame(table(factor(dados_TO_completos$CODMUNRES, levels = basesim$CODMUNRES)))
names(TORCR) = c("CODMUNRES", "TORCR")
basesim = merge(basesim, TORCR, by = "CODMUNRES", all.x = TRUE)

# TO_NN 
dados_TO_NN = dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y"), ]
TO_NN = as.data.frame(table(factor(dados_TO_NN$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_NN) = c("CODMUNRES", "TO_NN")
basesim = merge(basesim, TO_NN, by = "CODMUNRES", all.x = TRUE)

#  TO_N 
dados_TO_N = dados_sim_2[!(substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y")), ]
TO_N = as.data.frame(table(factor(dados_TO_N$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_N) = c("CODMUNRES", "TO_N")
basesim = merge(basesim, TO_N, by = "CODMUNRES", all.x = TRUE)

# TO_CB_I
dados_TO_CB_I = dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("A", "B"), ]
TO_CB_I = as.data.frame(table(factor(dados_TO_CB_I$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_CB_I) = c("CODMUNRES", "TO_CB_I")
basesim = merge(basesim, TO_CB_I, by = "CODMUNRES", all.x = TRUE)

#TO_CB_N
dados_TO_CB_N = dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("C", "D"), ]
TO_CB_N = as.data.frame(table(factor(dados_TO_CB_N$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_CB_N) = c("CODMUNRES", "TO_CB_N")
basesim = merge(basesim, TO_CB_N, by = "CODMUNRES", all.x = TRUE)

# TO_CB_C
dados_TO_CB_C = dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) == "I", ]
TO_CB_C = as.data.frame(table(factor(dados_TO_CB_C$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_CB_C) = c("CODMUNRES", "TO_CB_C")
basesim = merge(basesim, TO_CB_C, by = "CODMUNRES", all.x = TRUE)

# TO_CB_R
dados_TO_CB_R = dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) == "J", ]
TO_CB_R = as.data.frame(table(factor(dados_TO_CB_R$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_CB_R) = c("CODMUNRES", "TO_CB_R")
basesim = merge(basesim, TO_CB_R, by = "CODMUNRES", all.x = TRUE)

# TO_CB_O
dados_TO_CB_O = dados_sim_2[!(substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("A", "B", "C", "D", "I", "J", "V", "W", "X", "Y")), ]
TO_CB_O = as.data.frame(table(factor(dados_TO_CB_O$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_CB_O) = c("CODMUNRES", "TO_CB_O")
basesim = merge(basesim, TO_CB_O, by = "CODMUNRES", all.x = TRUE)

# TO_M 
dados_TO_M = dados_sim_2[dados_sim_2$SEXO == "Masculino", ]
TO_M = as.data.frame(table(factor(dados_TO_M$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_M) = c("CODMUNRES", "TO_M")
basesim = merge(basesim, TO_M, by = "CODMUNRES", all.x = TRUE)

# TO_F
dados_TO_F = dados_sim_2[dados_sim_2$SEXO == "Feminino", ]
TO_F = as.data.frame(table(factor(dados_TO_F$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_F) = c("CODMUNRES", "TO_F")
basesim = merge(basesim, TO_F, by = "CODMUNRES", all.x = TRUE)

# TO_F_IF 
dados_TO_F_IF = dados_sim_2[dados_sim_2$SEXO == "Feminino" & dados_sim_2$IDADE >= 415 & dados_sim_2$IDADE <= 449, ]
TO_F_IF = as.data.frame(table(factor(dados_TO_F_IF$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_F_IF) = c("CODMUNRES", "TO_F_IF")
basesim = merge(basesim, TO_F_IF, by = "CODMUNRES", all.x = TRUE)

# TO_FT
dados_TO_FT = dados_sim_2[dados_sim_2$TIPOBITO == "Fetal", ]
TO_FT = as.data.frame(table(factor(dados_TO_FT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_FT) = c("CODMUNRES", "TO_FT")
basesim = merge(basesim, TO_FT, by = "CODMUNRES", all.x = TRUE)

# TO_NT
dados_TO_NT = dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE <= 227, ]
TO_NT = as.data.frame(table(factor(dados_TO_NT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_NT) = c("CODMUNRES", "TO_NT")
basesim = merge(basesim, TO_NT, by = "CODMUNRES", all.x = TRUE)

# TO_NT_P
dados_TO_NT_P = dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE <= 206, ]
TO_NT_P = as.data.frame(table(factor(dados_TO_NT_P$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_NT_P) = c("CODMUNRES", "TO_NT_P")
basesim = merge(basesim, TO_NT_P, by = "CODMUNRES", all.x = TRUE)

# TO_NT_T
dados_TO_NT_T = dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE >= 207 & dados_sim_2$IDADE <= 227, ]
TO_NT_T = as.data.frame(table(factor(dados_TO_NT_T$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_NT_T) = c("CODMUNRES", "TO_NT_T")
basesim = merge(basesim, TO_NT_T, by = "CODMUNRES", all.x = TRUE)

# TO_PNT
dados_TO_PNT = dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE >= 228 & dados_sim_2$IDADE <= 311, ]
TO_PNT = as.data.frame(table(factor(dados_TO_PNT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_PNT) = c("CODMUNRES", "TO_PNT")
basesim = merge(basesim, TO_PNT, by = "CODMUNRES", all.x = TRUE)

# TO_MT_G
dados_TO_MT_G = dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez", ]
TO_MT_G = as.data.frame(table(factor(dados_TO_MT_G$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_G) = c("CODMUNRES", "TO_MT_G")
basesim = merge(basesim, TO_MT_G, by = "CODMUNRES", all.x = TRUE)

# TONT_B
dados_TONT_B = dados_TO_NT[dados_TO_NT$RACACOR == "Branca", ]
TONT_B = as.data.frame(table(factor(dados_TONT_B$CODMUNRES, levels = basesim$CODMUNRES)))
names(TONT_B) = c("CODMUNRES", "TONT_B")
basesim = merge(basesim, TONT_B, by = "CODMUNRES", all.x = TRUE)

# TONT_PT
dados_TONT_PT = dados_TO_NT[dados_TO_NT$RACACOR == "Preta", ]
TONT_PT = as.data.frame(table(factor(dados_TONT_PT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TONT_PT) = c("CODMUNRES", "TONT_PT")
basesim = merge(basesim, TONT_PT, by = "CODMUNRES", all.x = TRUE)

# TONT_A
dados_TONT_A = dados_TO_NT[dados_TO_NT$RACACOR == "Amarela", ]
TONT_A = as.data.frame(table(factor(dados_TONT_A$CODMUNRES, levels = basesim$CODMUNRES)))
names(TONT_A) = c("CODMUNRES", "TONT_A")
basesim = merge(basesim, TONT_A, by = "CODMUNRES", all.x = TRUE)

# TONT_PD
dados_TONT_PD = dados_TO_NT[dados_TO_NT$RACACOR == "Parda", ]
TONT_PD = as.data.frame(table(factor(dados_TONT_PD$CODMUNRES, levels = basesim$CODMUNRES)))
names(TONT_PD) = c("CODMUNRES", "TONT_PD")
basesim = merge(basesim, TONT_PD, by = "CODMUNRES", all.x = TRUE)

# TONT_I
dados_TONT_I = dados_TO_NT[dados_TO_NT$RACACOR == "Indígena", ]
TONT_I = as.data.frame(table(factor(dados_TONT_I$CODMUNRES, levels = basesim$CODMUNRES)))
names(TONT_I) = c("CODMUNRES", "TONT_I")
basesim = merge(basesim, TONT_I, by = "CODMUNRES", all.x = TRUE)

# TO_MT
dados_TO_MT = dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez" | 
                            dados_sim_2$TPMORTEOCO == "No parto" | 
                            dados_sim_2$TPMORTEOCO == "No abortamento" | 
                            dados_sim_2$TPMORTEOCO == "Até 42 dias após o término do parto" | 
                            dados_sim_2$TPMORTEOCO == "De 43 dias a 1 ano após o termino da gestação", ]
TO_MT = as.data.frame(table(factor(dados_TO_MT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT) = c("CODMUNRES", "TO_MT")
basesim = merge(basesim, TO_MT, by = "CODMUNRES", all.x = TRUE)

# TO_MT_DG
dados_TO_MT_DG = dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez", ]
TO_MT_DG = as.data.frame(table(factor(dados_TO_MT_DG$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_DG) = c("CODMUNRES", "TO_MT_DG")
basesim = merge(basesim, TO_MT_DG, by = "CODMUNRES", all.x = TRUE)

# TO_MT_PT
dados_TO_MT_PT = dados_sim_2[dados_sim_2$TPMORTEOCO == "No parto", ]
TO_MT_PT = as.data.frame(table(factor(dados_TO_MT_PT$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_PT) = c("CODMUNRES", "TO_MT_PT")
basesim = merge(basesim, TO_MT_PT, by = "CODMUNRES", all.x = TRUE)

# TO_MT_AB
dados_TO_MT_AB = dados_sim_2[dados_sim_2$TPMORTEOCO == "No abortamento", ]
TO_MT_AB = as.data.frame(table(factor(dados_TO_MT_AB$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_AB) = c("CODMUNRES", "TO_MT_AB")
basesim = merge(basesim, TO_MT_AB, by = "CODMUNRES", all.x = TRUE)

# TO_MT_42
dados_TO_MT_42 = dados_sim_2[dados_sim_2$TPMORTEOCO == "Até 42 dias após o término do parto", ]
TO_MT_42 = as.data.frame(table(factor(dados_TO_MT_42$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_42) = c("CODMUNRES", "TO_MT_42")
basesim = merge(basesim, TO_MT_42, by = "CODMUNRES", all.x = TRUE)

# TO_MT_43
dados_TO_MT_43 = dados_sim_2[dados_sim_2$TPMORTEOCO == "De 43 dias a 1 ano após o termino da gestação", ]
TO_MT_43 = as.data.frame(table(factor(dados_TO_MT_43$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_43) = c("CODMUNRES", "TO_MT_43")
basesim = merge(basesim, TO_MT_43, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P
dados_TO_MT_P = dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez" | 
                              dados_sim_2$TPMORTEOCO == "No parto" | 
                              dados_sim_2$TPMORTEOCO == "No abortamento" | 
                              dados_sim_2$TPMORTEOCO == "Até 42 dias após o término do parto", ]
TO_MT_P = as.data.frame(table(factor(dados_TO_MT_P$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P) = c("CODMUNRES", "TO_MT_P")
basesim = merge(basesim, TO_MT_P, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_I
dados_TO_MT_P_I = dados_TO_MT_P[dados_TO_MT_P$IDADE >= 415 & dados_TO_MT_P$IDADE <= 449, ]
TO_MT_P_I = as.data.frame(table(factor(dados_TO_MT_P_I$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_I) = c("CODMUNRES", "TO_MT_P_I")
basesim = merge(basesim, TO_MT_P_I, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_ES
TO_MT_P_ES = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "0", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_ES) = c("CODMUNRES", "TO_MT_P_ES")
basesim = merge(basesim, TO_MT_P_ES, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_EFI
TO_MT_P_EFI = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "1", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_EFI) = c("CODMUNRES", "TO_MT_P_EFI")
basesim = merge(basesim, TO_MT_P_EFI, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_EFII
TO_MT_P_EFII = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "2", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_EFII) = c("CODMUNRES", "TO_MT_P_EFII")
basesim = merge(basesim, TO_MT_P_EFII, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_EM
TO_MT_P_EM = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "3", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_EM) = c("CODMUNRES", "TO_MT_P_EM")
basesim = merge(basesim, TO_MT_P_EM, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_ESI
TO_MT_P_ESI = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "4", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_ESI) = c("CODMUNRES", "TO_MT_P_ESI")
basesim = merge(basesim, TO_MT_P_ESI, by = "CODMUNRES", all.x = TRUE)

# TO_MT_P_ESC
TO_MT_P_ESC = as.data.frame(table(factor(dados_TO_MT_P[dados_TO_MT_P$ESC2010 == "5", ]$CODMUNRES, levels = basesim$CODMUNRES)))
names(TO_MT_P_ESC) = c("CODMUNRES", "TO_MT_P_ESC")
basesim = merge(basesim, TO_MT_P_ESC, by = "CODMUNRES", all.x = TRUE)
# Tarefa 8: Exporte o banco de dados com o nome SIM_UF.csv

# Ao terminar a ETAPA 2 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 2"
# Faça um merge de script de SIM para main
write.csv(basesim, "SIM_TO.csv", row.names = FALSE)

#####################################################
# ETAPA 3: OUTROS BANCOS DE DADOS: IBGE, SNIS, ...
#####################################################
# Só inicie esta Etapa quando a professora orientar
# Ao terminar a ETAPA 2 faça um merge de SIM para main
# Altere as orientações do script e commit (em main) "Script com orientações ETAPA 3 - SIDRA"
# Abra um branch OUTROS
# Na branch OUTROS escreva os comandos da Tarefa 1 abaixo

# Tarefa 1. Acesso aos bancos de dados do SIDRA e obtenção da informação
# Leia os arquivos:
# 1. população residente estimada - UF e municípios - 2015 - SIDRA - tabela_6579.csv  
# 2. população residente censo 2010 - UF e municípios - total e por sexo - SIDRA - tabela_1552.csv  
# 3. população residente censo 2010 - por faixa etária -  UF - SIDRA - tabela_1552.csv
# 4. população residente censo 2010 - por faixa etária e sexo -  municípios - SIDRA - tabela_1552.csv
# A partir dos arquivos acima gere o banco de dados de nome SIDRA_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 POPRE_T
# 5 POPRC_T
# 6 POPRC_M
# 7 POPRC_F
# 8 POPRC_15
# 9 POPRC_15_49
# 10 POPRC_50
# 11 POPRC_F_15
# 12 POPRC_F_15_49
# 13 POPRC_F_50
dados_populacao_estimada = read.csv("população residente estimada - UF e municípios - 2015 - SIDRA - tabela_6579.csv", header = TRUE, sep = ";")
dados_populacao_por_sexo = read.csv("população residente censo 2010 - UF e municípios - total e por sexo - SIDRA - tabela_1552.csv", header = TRUE, sep = ";")
dados_populacao_por_faixa_etaria = read.csv("população residente censo 2010 - por faixa etária -  UF - SIDRA - tabela_1552.csv", header = TRUE, sep = ";")
dados_populacao_por_faixa_etaria_municipio = read.csv("população residente censo 2010 - por faixa etária e sexo -  municípios - SIDRA - tabela_1552.csv", header = TRUE, sep = ";")
colunas_idade <- c("CODMUNRES", "F_IDADE", "POP", "POPF")
idade_uf <- dados_populacao_por_faixa_etaria[dados_populacao_por_faixa_etaria$CODMUNRES == "17", colunas_idade]
idade_mun <- dados_populacao_por_faixa_etaria_municipio[substr(dados_populacao_por_faixa_etaria_municipio$CODMUNRES, 1, 2) == "17", colunas_idade]
idade_to_consolidada <- rbind(idade_uf, idade_mun)
SIDRA_UF <- dados_populacao_estimada[substr(dados_populacao_estimada$CODMUNRES, 1, 2) == "17", c("CODMUNRES", "POPRE_T")]
SIDRA_UF <- merge(SIDRA_UF, 
                  dados_populacao_por_sexo[substr(dados_populacao_por_sexo$CODMUNRES, 1, 2) == "17", 
                                           c("CODMUNRES", "POPRC_T", "POPRC_M", "POPRC_F")], 
                  by = "CODMUNRES", 
                  all.x = TRUE)
SIDRA_UF <- merge(SIDRA_UF, 
                  idade_to_consolidada, 
                  by = "CODMUNRES", 
                  all.x = TRUE)
SIDRA_UF$ANO <- 2015
SIDRA_UF$NIVEL <- ifelse(SIDRA_UF$CODMUNRES == "17", "UF", "MUNICIPIO")

menor_15 <- c("0 a 4 anos", "5 a 9 anos", "10 a 14 anos")
entre_15_49 <- c("15 a 19 anos", "20 a 24 anos", "25 a 29 anos", 
                 "30 a 34 anos", "35 a 39 anos", "40 a 44 anos", "45 a 49 anos")

v8_11 <- aggregate(cbind(POP, POPF) ~ CODMUNRES, 
                   data = SIDRA_UF[SIDRA_UF$F_IDADE %in% menor_15, ], sum)
names(v8_11) <- c("CODMUNRES", "POPRC_15", "POPRC_F_15")

v9_12 <- aggregate(cbind(POP, POPF) ~ CODMUNRES, 
                   data = SIDRA_UF[SIDRA_UF$F_IDADE %in% entre_15_49, ], sum)
names(v9_12) <- c("CODMUNRES", "POPRC_15_49", "POPRC_F_15_49")

v10_13 <- aggregate(cbind(POP, POPF) ~ CODMUNRES, 
                    data = SIDRA_UF[!(SIDRA_UF$F_IDADE %in% c(menor_15, entre_15_49)), ], sum)
names(v10_13) <- c("CODMUNRES", "POPRC_50", "POPRC_F_50")

SIDRA_UF <- unique(SIDRA_UF[, c("ANO", "NIVEL", "CODMUNRES", "POPRE_T", "POPRC_T", "POPRC_M", "POPRC_F")])

SIDRA_UF <- merge(SIDRA_UF, v8_11, by = "CODMUNRES", all.x = TRUE)
SIDRA_UF <- merge(SIDRA_UF, v9_12, by = "CODMUNRES", all.x = TRUE)
SIDRA_UF <- merge(SIDRA_UF, v10_13, by = "CODMUNRES", all.x = TRUE)
SIDRA_UF <- SIDRA_UF[, c("ANO", "NIVEL", "CODMUNRES", "POPRE_T", "POPRC_T", 
                         "POPRC_M", "POPRC_F", "POPRC_15", "POPRC_15_49", 
                         "POPRC_50", "POPRC_F_15", "POPRC_F_15_49", "POPRC_F_50")]
SIDRA_UF <- SIDRA_UF[order(SIDRA_UF$NIVEL, decreasing = TRUE), ]
# Exportando arquivo
write.csv(SIDRA_UF, "SIDRA_TO.csv", row.names = FALSE)
# Tarefa 2: Acesso aos bancos de dados do SINISA e obtenção da informação
# Escreva os comandos da Tarefa 2 estando na branch OUTROS# Leia o arquivo agua e esgoto - município - 2015.csv 
# A partir do arquivo acima gere o banco de dados de nome SINISA_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 POPR_RA
# 5 POPR_RE

# Exporte o arquivo em formato CSV
# Faça o commit com a mensagem "Script e dados TAREFA 3 - SINISA"

# Tarefa 3: Acesso aos bancos de dados do ATLAS  e obtenção da informação
# Escreva os comandos da Tarefa 3 estando na branch OUTROS
# Leia os arquivos:
# 1. códigos dos municípios - 2010.csv      
# 2. IDHM - 2010 (CENSO) e 2015 (PNAD) - total e por sexo - UF - Atlas Brasil.csv
# 3. IDHM - 2010 - municípios - Atlas Brasil.csv
# A partir do arquivo acima gere o banco de dados de nome ATLAS_UF com as seguintes variáveis:
# 1  ANO    
# 2  NIVEL
# 3  CODMUNRES
# 4 IDHM_A
# 5 IDHM_CA
# 6 IDHM_CA_M
# 7 IDHM_CA_F

# Exporte o arquivo em formato CSV# Faça o commit com a mensagem "Script e dados TAREFA 3 - ATLAS"
#####################################################################################################
# ETAPA 4: GERAR BANCO DE DADOS FINAL DO ESTADO, BASEADO NAS ANÁLISES DE SINASC, SIM, IBGE, SNIS,...
######################################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 4

# Cada aluno gerar um dataframe de uma única linha (referente ao seu estado) com as variáveis na ordem indicada pela professora



############################################################################################
# ETAPA 5: EMPILHAMENTO DOS DATAFRAMES DE CADA ESTADO, GERANDO UM DATAFRAME DE 27 LINHAS
############################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 5

# 1. Enviar arquivos para as pastas do repositório da Professora no GitHUb
# 2. A professora fará o empilhamentos dos dataframes

