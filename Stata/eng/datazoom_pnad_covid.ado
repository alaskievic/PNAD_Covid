******************************************************
*             datazoom_pnad_covid.ado              *
******************************************************
* version 1.0

program define datazoom_pnad_covid

syntax, months(numlist) original(str) saving(str) 

/* Pastas para guardar arquivos da sessão */
cd `"`saving'"'

/* Criação de pastas para salvar os arquivos */
capture mkdir pnad_covid
if _rc == 693 {
   tempname numpasta
   local numpasta = 0
   while _rc == 693 {
      capture mkdir "pnad_covid_`++numpasta'"
   }
   cd "pnad_covid_`numpasta'"
}
else {
   cd "pnad_covid"
}
loc caminhoprin = c(pwd)

/* Dicionário */
*findfile pnad_covid.dct
*loc dic = r(fn)

/* Extração dos arquivos */

* separar o ado em duas partes
foreach month in `months'{
	di as input "Extracting file PNAD_COVID_0`month'2020  ..."
	*cap infile using "`dic'", using("`original'/PNAD_COVID_`month'.csv") clear	
	import delimited using "`original'/PNAD_COVID_0`month'2020.csv", clear	
	if _rc == 0 {
	// normal labels
	cap label var Ano		 "Year"
	cap label var UF		 "State"
	cap label var CAPITAL	 "Capital "
	cap label var RM_RIDE	 "Metropolitan Region"
	cap label var V1008	 "Household selection number"
	cap label var V1012	 "Week of the month "
	cap label var V1013	 "Month of survey "
	cap label var V1016	 "Household interview number"
	cap label var Estrato	 "Stratum "
	cap label var UPA		 "District borders "
	cap label var V1022	 "Type of situation in the household"
	cap label var V1023	 "Area type "
	cap label var V1030	 "Population projecting"
	cap label var V1031		 "Weight"
	cap label var V1032		 "Weight"
	cap label var posest	 "Projecting domain"
	cap label var A001	 "Order number"
	cap label var A001A	 "Household condition"
	cap label var A001B1	 "Day of birth"
	cap label var A001B2	 "Month of birth "
	cap label var A001B3	 "Year of birth "
	cap label var A002	 "Resident's age"
	cap label var A003	 "Gender "
	cap label var A004	 "Skin color or race"
	cap label var A005	 "Schooling"
	cap label var B0011	 "In the last week did you have fever? "
	cap label var B0012	 "In the last week did you have cough? "
	cap label var B0013	 "In the last week did you have sore throat? "
	cap label var B0014	 "In the last week did you have difficulty breathing? "
	cap label var B0015	 "In the last week did you have headache? "
	cap label var B0016	 "In the last week did you have chest pain? "
	cap label var B0017	 "In the last week did you have nausea? "
	cap label var B0018	 "In the last week did you have stuffy or runny nose? "
	cap label var B0019	 "In the last week did you have fatigue? "
	cap label var B00110	 "In the last week did you have eye pain? "
	cap label var B00111	 "In the last week did you have loss of smell or taste? "
	cap label var B00112	 "In the last week did you have muscle pain? "
	cap label var B002	 "Because of that, did you go to any health establishment? "
	cap label var B0031	 "Providence taken to recover from symptoms was stay at home "
	cap label var B0032	 "Providence taken to recover from symptoms was call some health professional "
	cap label var B0033	 "Providence taken to recover from symptoms was buy and/or take medicine by its own "
	cap label var B0034	 "Providence taken to recover from symptoms was buy and/or take medicine by medical advice "
	cap label var B0035	 "Providence taken to recover from symptoms was a visit from some public health professional "
	cap label var B0036	 "Providence taken to recover from symptoms was a visit from a private health professional  "
	cap label var B0037	 "Providence taken to recover from symptoms was other "
	cap label var B0041	 "Location that sought care was health post/basic health unit/family health team (doctor, nurse, nursing technician or community health worker) "
	cap label var B0042	 "Location that sought care was first aid from SUS/UPA "
	cap label var B0043	 "Location that sought care was hospital of SUS "
	cap label var B0044	 "Location that sought care was ambulatory or private doctor's office or linked to the armed forces "
	cap label var B0045	 "Location that sought care was private emergency room or linked to the armed forces "
	cap label var B0046	 "Location that sought care was private hospital or linked to the armed forces "
	cap label var B005	 "When looking for the hospital, had to stay in the hospital for a day or more"
	cap label var B006	 "During hospitalization, it was sedated, intubated and placed on artificial respiration with a ventilator "
	cap label var B007	 "Do have a medical health plan, whether private, company or public agency"
	cap label var C001	 "In the last week, for at least an hour, did you work or any occupational activity?"
	cap label var C002	 "In the last week, was temporarily away from work? "
	cap label var C003	 "What is the main reason for this temporary removal? "
	cap label var C004	 "Continued to be paid (even partially) for this work"
	cap label var C005	 "How long have you been away from that job? "
	cap label var C0051	 "Time that was away (from 1 Month to less than 1 Year)  "
	cap label var C0052	 "Time that was away (from 1 Year to less than 2 Years)  "
	cap label var C0053	 "Time that was away (from 02 Years to 98 Years)  "
	cap label var C006	 "Has more than one job"
	cap label var C007	 "At work (single or main) I had that week, it was: "
	cap label var C007A	 "This work was in the area:"
	cap label var C007B	 "Do you have a formal contract and are you a public servant?: "
	cap label var C007C	 "What kind of job, job or function do you do in your job (single or main)?  "
	cap label var C007D	 "What is the main activity of local or company in which you work?"
	cap label var C007E	 "In the last week, how many employees worked in that firm/company that ... had? "
	cap label var C007E1	 "1 to 5 employees "
	cap label var C007E2	 "6 to 10 employees "
	cap label var C008	 "How many hours a week did you normally work? "
	cap label var C009	 "How many hours, In the last week, did you actually work? "
	cap label var C010	 "How much he received (or withdrew) normally in all works "
	cap label var C0101	 "Received/withdrawn normally in cash "
	cap label var C01011	 "Cash/withdrawal band number"
	cap label var C01012	 "Cash value"
	cap label var C0102	 "Usually received on products and merchandise"
	cap label var C01021	 "Income/withdrawal range number on products and goods"
	cap label var C01022	 "Value in products and goods "
	cap label var C0103	 "Normally received only benefits "
	cap label var C0104	 "He was unpaid "
	cap label var C011A	 "How much he received (or withdrew) normally in all works "
	cap label var C011A1	 "Received/withdrawn normally in cash "
	cap label var C011A11	 "Cash/withdrawal band number"
	cap label var C011A12	 "Cash value"
	cap label var C011A2	 "Usually received on products and merchandise"
	cap label var C011A21	 "Income/withdrawal range number on products and goods"
	cap label var C011A22	 "Value in products and goods "
	cap label var C012	 "Most of the time, In the last week, was this (single or main) job performed in the same place you usually work?"
	cap label var C013	 "In the last week, you were in remote work (home office or telework)? "
	cap label var C014	 "Do you contribute to the INSS??   "
	cap label var C015	 "In the last week ___ have you taken any effective steps to get a job?   "
	cap label var C016	 "What is the main reason for not looking for work In the last week?  "
	cap label var C017A	 "Did any other resident of this household work in a paid way In the last week? "
	cap label var D0011	 "Income received from retirement and pension by all residents"
	cap label var D0013	 "Sum of received values"
	cap label var D0021	 "Alimony income, donation or money allowance from person who did not live at home"
	cap label var D0023	 "Sum of received values"
	cap label var D0031	 "Income from Bolsa Família Program"
	cap label var D0033	 "Sum of received values"
	cap label var D0041	 "On the Month of ... (Reference month), ... received income from the assistance benefit of Continued Provision - BPC-LOAS? "
	cap label var D0043	 "Sum of received values"
	cap label var D0051	 "Emergency aid related to coronavirus"
	cap label var D0053	 "Sum of received values"
	cap label var D0061	 "Unemployment insurance"
	cap label var D0063	 "Sum of received values"
	cap label var D0071	 "Other income, with rent, lease, private pension, scholarship, income from financial investments, etc."
	cap label var D0073	 "Sum of received values"
	cap label var F001	 "This address is:"
	cap label var F0021	 "What was the monthly amount of rent paid, or what should have been paid, in the reference month?"
	cap label var F0022	 "Track number of paid rent"
	cap label var F0061	 "Who answered the questionnaire?"
	cap label var F006	 "Order number of the resident who provided the label var"
	//
	cap label var ano		 "Year"
	cap label var uf		 "State"
	cap label var capital	 "Capital "
	cap label var rm_ride	 "Metropolitan Region"
	cap label var v1008	 "Household selection number"
	cap label var v1012	 "Week of the month "
	cap label var v1013	 "Month of survey "
	cap label var v1016	 "Household interview number"
	cap label var estrato	 "Stratum "
	cap label var upa		 "District borders "
	cap label var v1022	 "Type of situation in the household"
	cap label var v1023	 "Area type"
	cap label var v1030	 "Population projecting"
	cap label var v1031		 "Weight"
	cap label var v1032		 "Weight"
	cap label var posest	 "Projecting domain"
	cap label var a001	 "Order number"
	cap label var a001a	 "Household condition"
	cap label var a001b1	 "Day of birth"
	cap label var a001b2	 "Month of birth "
	cap label var a001b3	 "Year of birth "
	cap label var a002	 "Resident's age"
	cap label var a003	 "Gender "
	cap label var a004	 "Skin color or race"
	cap label var a005	 "Schooling"
	cap label var b0011	 "In the last week did you have fever? "
	cap label var b0012	 "In the last week did you have cough? "
	cap label var b0013	 "In the last week did you have sore throat? "
	cap label var b0014	 "In the last week did you have difficulty breathing? "
	cap label var b0015	 "In the last week did you have headache? "
	cap label var b0016	 "In the last week did you have chest pain? "
	cap label var b0017	 "In the last week did you have nausea? "
	cap label var b0018	 "In the last week did you have stuffy or runny nose? "
	cap label var b0019	 "In the last week did you have fatigue? "
	cap label var b00110	 "In the last week did you have eye pain? "
	cap label var b00111	 "In the last week did you have loss of smell or taste? "
	cap label var b00112	 "In the last week did you have muscle pain? "
	cap label var b002	 "Because of that, did you go to any health establishment? "
	cap label var b0031	 "Providence taken to recover from symptoms was stay at home "
	cap label var b0032	 "Providence taken to recover from symptoms was call some health professional "
	cap label var b0033	 "Providence taken to recover from symptoms was buy and/or take medicine by its own "
	cap label var b0034	 "Providence taken to recover from symptoms was buy and/or take medicine by medical advice "
	cap label var b0035	 "Providence taken to recover from symptoms was a visit from some public health professional "
	cap label var b0036	 "Providence taken to recover from symptoms was a visit from a private health professional  "
	cap label var b0037	 "Providence taken to recover from symptoms was other "
	cap label var b0041	 "Location that sought care was health post/basic health unit/family health team (doctor, nurse, nursing technician or community health worker) "
	cap label var b0042	 "Location that sought care was first aid from SUS/UPA "
	cap label var b0043	 "Location that sought care was hospital of SUS "
	cap label var b0044	 "Location that sought care was ambulatory or private doctor's office or linked to the armed forces "
	cap label var b0045	 "Location that sought care was private emergency room or linked to the armed forces "
	cap label var b0046	 "Location that sought care was private hospital or linked to the armed forces "
	cap label var b005	 "When looking for the hospital, had to stay in the hospital for a day or more"
	cap label var b006	 "During hospitalization, it was sedated, intubated and placed on artificial respiration with a ventilator "
	cap label var b007	 "Do have a medical health plan, whether private, company or public agency"
	cap label var c001	 "In the last week, for at least an hour, did you work or any occupational activity?"
	cap label var c002	 "In the last week, was temporarily away from work? "
	cap label var c003	 "What is the main reason for this temporary removal? "
	cap label var c004	 "Continued to be paid (even partially) for this work"
	cap label var c005	 "How long have you been away from that job? "
	cap label var c0051	 "Time that was away (from 1 Month to less than 1 Year)  "
	cap label var c0052	 "Time that was away (from 1 Year to less than 2 Years)  "
	cap label var c0053	 "Time that was away (from 2 Years to 98 Years)  "
	cap label var c006	 "Has more than one job"
	cap label var c007	 "At work (single or main) I had that week, it was: "
	cap label var c007a	 "This work was in the area:"
	cap label var c007b	 "Do you have a formal contract and are you a public servant?: "
	cap label var c007c	 "What kind of job, job or function do you do in your job (single or main)?  "
	cap label var c007d	 "What is the main activity of local or company in which you work?"
	cap label var c007e	 "In the last week, how many employees worked in that firm/company that ... had? "
	cap label var c007e1	 "1 to 5 employees "
	cap label var c007e2	 "6 to 10 employees "
	cap label var c008	 "How many hours a week did you normally work? "
	cap label var c009	 "How many hours, In the last week, did you actually work? "
	cap label var c010	 "How much he received (or withdrew) normally in all works "
	cap label var c0101	 "Received/withdrawn normally in cash "
	cap label var c01011	 "Cash/withdrawal band number"
	cap label var c01012	 "Cash value"
	cap label var c0102	 "Usually received on products and merchandise"
	cap label var c01021	 "Income/withdrawal range number on products and goods"
	cap label var c01022	 "Value in products and goods "
	cap label var c0103	 "Normally received only benefits "
	cap label var c0104	 "He was unpaid "
	cap label var c011a	 "How much he received (or withdrew) normally in all works "
	cap label var c011a1	 "Received/withdrawn normally in cash "
	cap label var c011a11	 "Cash/withdrawal band number"
	cap label var c011a12	 "Cash value"
	cap label var c011a2	 "Usually received on products and merchandise"
	cap label var c011a21	 "Income/withdrawal range number on products and goods"
	cap label var c011a22	 "Value in products and goods "
	cap label var c012	 "Most of the time, In the last week, was this (single or main) job performed in the same place you usually work?"
	cap label var c013	 "In the last week, you were in remote work (home office or telework)? "
	cap label var c014	 "Do you contribute to the INSS??   "
	cap label var c015	 "In the last week ___ have you taken any effective steps to get a job?   "
	cap label var c016	 "What is the main reason for not looking for work In the last week?  "
	cap label var c017a	 "Did any other resident of this household work in a paid way In the last week? "
	cap label var d0011	 "Income received from retirement and pension by all residents"
	cap label var d0013	 "Sum of received values"
	cap label var d0021	 "Alimony income, donation or money allowance from person who did not live at home"
	cap label var d0023	 "Sum of received values"
	cap label var d0031	 "Income from Bolsa Família Program"
	cap label var d0033	 "Sum of received values"
	cap label var d0041	 "On the Month of ... (Reference month), ... received income from the assistance benefit of Continued Provision - BPC-LOAS? "
	cap label var d0043	 "Sum of received values"
	cap label var d0051	 "Emergency aid related to coronavirus"
	cap label var d0053	 "Sum of received values"
	cap label var d0061	 "Unemployment insurance"
	cap label var d0063	 "Sum of received values"
	cap label var d0071	 "Other income, with rent, lease, private pension, scholarship, income from financial investments, etc."
	cap label var d0073	 "Sum of received values"
	cap label var f001	 "This address is:"
	cap label var f0021	 "What was the monthly amount of rent paid, or what should have been paid, in the reference month?"
	cap label var f0022	 "Track number of paid rent"
	cap label var f0061	 "Who answered the questionnaire?"
	cap label var f006	 "Order number of the resident who provided the label var"
	save PNAD_COVID_0`month'2020, replace
	}
	else continue, break
}


di _newline "This version of the datazoom_pnadcontinua package is compatible with the latest version of the PNAD Covid published on 06 July 2020"
di _newline "The datasets were saved in `c(pwd)'"
end
		
