class Account(object):
    @property
    def email(self):
        #create email and _email attributes
        return self._email

    @email.setter
    #set attribute
    #instance_of_Account.email = 'hainm.comp@gmail.com'
    def email(self, value):
        if '@' not in value:
            raise ValueError('Invalid email address.')
        self._email = value

