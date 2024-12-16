/// <reference types="cypress"/>
import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor"




Given("Eu estou na página do formulário", () => {
  cy.visit('https://www.pagbrasil.com/fb831484f9611648f05411b3746466b6/form.html')
})

When("Eu preencho o campo name com {string}", (Name) => {   
    expect(Name).to.match(/^[a-zA-Z\s0-9]+$/)
    cy.get('#name').type(Name)
    cy.get('#name').invoke('val').should('have.length.at.most', 255);
});

When("Eu preencho o campo email com {string}", (Email) => {
    expect(Email).to.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)
    cy.get('#email').type(Email)
    cy.get('#email').invoke('val').should('have.length.at.most', 150 )
})

When("Eu preencho o campo company com {string}", (Company) => {
    expect(Company).to.match(/^[a-zA-Z\s0-9]+$/)
    cy.get('#company').type(Company)
    cy.get('#company').invoke('val').should('have.length.at.most', 200)     
})

When("Eu preencho o campo website com {string}", (Website) => {
    expect(Website).to.match('/^[a-z0-9]+(?:-[a-z0-9]+)*(\.[a-z0-9]+)+(?:/[^/]+)*/i')
    cy.get('#website').type(Website)
    cy.get('#website').invoke('val').should('have.length.at.most', 200)  
})

When("Eu preencho o campo phone com {string}", (Phone) => {
    expect(Phone).to.match(/^\(\d{2}\)\s\d{5}-\d{4}$/)
    cy.get('#phone').type(Phone)
    cy.get('#phone').invoke('val').should('have.length.at.most', 15)
})

When("Eu preencho o campo inquiry com {string}", (Inquiry) => {
    expect(Inquiry).to.match(/^[a-zA-Z\s0-9]+$/)
    cy.get('#inquiry').type(Inquiry)
    cy.get('#inquiry').invoke('val').should('have.length.at.most', 500)
    
})

When("Eu submeto o formulário", () => {
    cy.get('[type="submit"]').click()
})

Then('sera exibido a mensagem {string}', (mensagem) => {
  cy.contains(mensagem).should('be.visible');
});