/// <reference types="cypress"/>
import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor"

const url = '/api/endpoint'; // Formulário não possui API funcional

Given('Eu envio o formulário com os dados {string}, {string}, {string}, {string}, {string}, {string}', (name, email, company, website, phone, inquiry) => {
    cy.api({
      method: 'POST',
      url,
      body: {
        name,
        email,
        company,
        website,
        phone,
        inquiry,
      },
      failOnStatusCode: false, 
    }).as('apiResponse')
  })
  
  Then('o status da resposta é 200 com sucesso true', () => {
    cy.get('@apiResponse').then((response) => {
      expect(response.status).to.eq(200)
      expect(response.body.sucesso).to.be.true
    })
  })
  
  Then('o status da resposta é 412 com mensagem {string}', (mensagem) => {
    cy.get('@apiResponse').then((response) => {
      expect(response.status).to.eq(412)
      expect(response.body.sucesso).to.be.false
      expect(response.body.mensagem).to.eq(mensagem)
    })
  })
  