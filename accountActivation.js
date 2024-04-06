import { LightningElement, api, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { getRecord } from 'lightning/uiRecordApi';
import updateAccount from '@salesforce/apex/AccountsControllers.updateAccount';

const FIELDS = ['Account.Actives__c'];

export default class AccountActivation extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;

    activateAccount() {
        updateAccount({ accountId: this.recordId, isActive: true })
            .then(result => {

                return refreshApex(this.account);
            })
            .catch(error => {
              
            });
    }
    
}
