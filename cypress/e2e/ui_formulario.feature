Feature: Formulário de Contato


  Scenario Outline: Enviar formulario com sucesso
    Given Eu estou na página do formulário
    When Eu preencho o campo name com <Name>
    And Eu preencho o campo email com <Email>
    And Eu preencho o campo company com <Company>
    And Eu preencho o campo website com <Website>
    And Eu preencho o campo phone com <Phone>
    And Eu preencho o campo inquiry com <Inquiry>
    Then Eu submeto o formulário

    Examples:
      | Name        | Email                     | Company          | Website                        | Phone           | Inquiry                       |
      | Diego 0101  | diego.teste123@teste.co m | Minha empresa 01 | http://www.minhaempresa.com    | (51) 9851-0101  | Gostaria de mais informações. |

  Scenario Outline: Enviar formulario com dados invalidos
    When Eu preencho o campo name com <Name>
    And Eu preencho o campo email com <Email>
    And Eu preencho o campo company com <Company>
    And Eu preencho o campo website com <Website>
    And Eu preencho o campo phone com <Phone>
    And Eu preencho o campo inquiry com <Inquiry>
    And eu submeto o formulário
    Then sera exibido a mensagem <mensagem>

    Examples:
      | Name        | Email                 | Company       | Website                     | Phone           | Inquiry                           | mensagem                |
      | Diego#0101  | diego.1010@teste.com  | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Name inválido.    |
      | Diego 0101  | diego.1010.teste.com  | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Email inválido.   |
      | Diego 0101  | diego.1010@teste.com  | Empresa_0101  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Company inválido. |
      | Diego 0101  | diego.1010@teste.com  | Empresa 0101  | http://www_minhaempresa_com | (51) 9851-0101  | Gostaria de mais informações.     | Campo Website inválido. |
      | Diego 0101  | diego.1010@teste.com  | Empresa 0101  | http://www.minhaempresa.com | (51) ABCD-0101  | Gostaria de mais informações.     | Campo Phone inválido.   |
      | Diego 0101  | diego.1010@teste.com  | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101  | Gostaria de  @@ mais informações. | Campo Inquiry inválido. |

  Scenario Outline: Enviar formulario sem campos obrigatorios
    When Eu preencho o campo name com <Name>
    And Eu preencho o campo email com <Email>
    And Eu preencho o campo company com <Company>
    And Eu preencho o campo website com <Website>
    And Eu preencho o campo phone com <Phone>
    And Eu preencho o campo inquiry com <Inquiry>
    Then eu submeto o formulário

    Examples:
      | Name        | Email                | Company       | Website                     | Phone          | Inquiry                         | mensagem                |
      | {backspace} | diego.1010.teste.com | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101 | Gostaria de mais informações.   | Campo Name inválido.    |
      | Diego 0101  |                      | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101 | Gostaria de mais informações.   | Campo Email inválido.   |
      | Diego 0101  | diego.1010.teste.com |               | http://www.empresa.com      | (51) 9851-0101 | Gostaria de mais informações.   | Campo Company inválido. |
      | Diego 0101  | diego.1010.teste.com | Empresa 0101  |                             | (51) 9851-0101 | Gostaria de mais informações.   | Campo Website inválido. |
      | Diego 0101  | diego.1010.teste.com | Empresa 0101  | http://www.minhaempresa.com |                | Gostaria de mais informações.   | Campo Phone inválido.   |
      | Diego 0101  | diego.1010.teste.com | Empresa 0101  | http://www.minhaempresa.com | (51) 9851-0101 |                                 | Campo Inquiry inválido. |
