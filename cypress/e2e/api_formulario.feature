Feature: Formulário de Contato


  Scenario Outline: Enviar formulário com sucesso
        Given Eu envio o formulário com os dados <Name> <Email> <Company> <Website> <Phone> <Inquiry>
        Then o status da resposta e 200 com possui sucesso true

    Examples:
      | Name              | Email                     | Company          | Website                        | Phone           | Inquiry                       |
      | Diego 1010        | diego.teste123@teste.co m | Minha empresa 10 | http://www.minhaempresa.com    | (51) 9851-0101  | Gostaria de mais informações. |

  Scenario Outline: Enviar formulario com dados invalidos
    Given Eu envio o formulário com os dados <Name> <Email> <Company> <Website> <Phone> <Inquiry>
    Then o status da resposta é 412 mensagem "<mensagem>"

    Examples:
      | Name              | Email                 | Company       | Website                     | Phone           | Inquiry                           | mensagem                |
      | Diego 1010        | diego.1010.teste.com  | Empresa 1010  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Email inválido.   |
      | Diego 1010        | diego.1010@teste.com  | Empresa_1010  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Company inválido. |
      | Diego 1010        | diego.1010@teste.com  | Empresa 1010  | http://www_minhaempresa_com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Website inválido. |
      | Diego 1010        | diego.1010@teste.com  | Empresa 1010  | http://www.minhaempresa.com | (51) ABCD-0101  | Gostaria de mais informações.     | Campo Phone inválido.   |
      | Diego 1010        | diego.1010@teste.com  | Empresa 1010  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de  @@ mais informações. | Campo Inquiry inválido. |

  Scenario Outline: Enviar formulario sem campos obrigatorios
    Given Eu envio o formulário sem algum dado <Name> <Email> <Company> <Website> <Phone> <Inquiry>
        Then o status da resposta é 412 mensagem "<mensagem>"

    Examples:
      | Name              | Email                | Company       | Website                     | Phone          | Inquiry                         | mensagem                |
      | {backspace}       | diego.1010.teste.com | Empresa 1010  | http://www.minhaempresa.com | (51) 9851-0101 | Gostaria de mais informações.   | Campo Name inválido.    |
      | João da Silva 123 |                      | Empresa 1010  | http://www.minhaempresa.com | (51) 9851-0101 | Gostaria de mais informações.   | Campo Email inválido.   |
      | João da Silva 123 | diego.1010.teste.com |               | http://www.empresa.com      | (51) 9851-0101 | Gostaria de mais informações.   | Campo Company inválido. |
      | João da Silva 123 | diego.1010.teste.com | Empresa 1010  |                             | (51) 9851-0101 | Gostaria de mais informações.   | Campo Website inválido. |
      | João da Silva 123 | diego.1010.teste.com | Empresa 1010  | http://www.minhaempresa.com |                | Gostaria de mais informações.   | Campo Phone inválido.   |
      | João da Silva 123 | diego.1010.teste.com | Empresa 1010  | http://www.minhaempresa.com | (51) 9851-0101 |                                 | Campo Inquiry inválido. |
