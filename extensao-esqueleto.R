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


# Tarefa 2. Reduzir dados_sim apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sim_1
# as colunas serão: 1, 3, 4, 8, 9, 10, 11, 14, 17, 35, 36, 37, 47, 77, 84
# nomes das respectivas variáveis: CONTADOR, TIPOBITO, DTOBITO, DTNASC, IDADE, SEXO, RACACOR, ESC2010, CODMUNRES, TPMORTEOCO, 
# OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO

# Tarefa 3. Reduzir dados_sim_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sim_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 

# observar abaixo o número de óbitos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 7948      12: 3517      13: 16675     14: 2091      15: 37365     16: 2946       17: 7402
# 21: 33666     22: 19366     23: 55258     24: 20153     25: 26422     26: 62556      27: 19756     28: 13453     29: 87083
# 31: 131274    32: 22332     33: 127714    35: 287645     
# 41: 70839     42: 37984     43: 82349
# 50: 15457     51: 17095     52: 38854     53: 11975

# Exportar o arquivo com o nome dados_sim_2.csv


# Ao concluir a Tarefa 3 da Etapa 2 commite e envie para o repositório REMOTO o script e dados_sim_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sim_2 a frequência das categorias das seguintes variáveis: TIPOBITO, SEXO, RACACOR, 
# TPMORTEOCO, OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO


# Tarefa 5. Atribuir para cada variável de dados_sim_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# veja o dicionário do SIM para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADE verificar se existem valores como 99 para NA


# Tarefa 6. Atribuir legendas para as categorias das variáveis qualitativas investigadas na tarefa 4.
# Exemplo: dados_sim_2$TIPOBITO = factor(dados_sim_2$TIPOBITO, levels = c(1,2), 
# labels = c("Fetal", "Não fetal")

# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados


# Tarefa 7. Crie um banco de dados, de nome SIM_UF.csv (Exemplo: SIM_RJ.csv), contendo as 41 variáveis listadas no arquivo “Variáveis - Projeto - Tarefa 7 da Etapa 2.pdf”
# Atenção:
# 1. Para informações gerais utilize CAUSABAS, SEXO e IDADE
# 2. Para informações fetais utilize TIPOBITO
# 3. Para informações neonatais utilize TIPOBITO não fetal e IDADE entre 0 e 27 dias e RACACOR
# 4. Para informações maternas utilize TPMORTEOCO, ESC e IDADE


# Tarefa 8: Exporte o banco de dados com o nome SIM_UF.csv

# Ao terminar a ETAPA 2 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 2"
# Faça um merge de script de SIM para main





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

