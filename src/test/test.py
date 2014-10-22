class Email:  
    def __init__(self, _value=''):
        self._email= _value

    def set_email(self, value):
        if '@' not in value:
            raise Exception("This doesn't look like an email address.")
        self._email = value
    
    def get_email(self):
        return self._email
    
    email = property(get_email, set_email)

print Email().email
e = Email("hainm.comp@gmail.com")

print e._email
