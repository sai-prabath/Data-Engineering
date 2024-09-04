class Payment:
    def getPayment(self):
        pass

class Gpay(Payment):
    def getPayment(self):
        print("payment done in Gpay")

class Phonepay(Payment):
    def getPayment(self):
        print("payment done in Phone pay")

class Amazonpay(Payment):
    def getPayment(self):
        print("payment done in Amazon pay")


payment = Phonepay()
payment.getPayment()