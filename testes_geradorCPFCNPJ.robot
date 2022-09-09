*** Settings ***
Library    ./Libraries/geradorCPFCNPJ/geradorCPF_CNPJ.py

*** Test Cases ***
Geração de CPF
    Gerar CPF

Geração CNPJ
    Gerar CNPJ

*** Keywords ***
Gerar CPF
    ${CPF}    geradorCPF_CNPJ.Generate Cpf
    
Gerar CNPJ
    ${CNPJ}    geradorCPF_CNPJ.Generate Cnpj