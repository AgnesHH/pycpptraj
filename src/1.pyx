# distutils: language = c++


cdef class Vec3:
    def __cinit__(self):
        self.thisptr = new _Vec3()

    def __dealloc__(self):
        del self.thisptr

    def Vec3(self):

    def Vec3(self, Vec3 rhs):

    def Vec3(self,double vx, double vy, double vz):

    def Vec3(self,double vxyz):

    def Vec3(self, double * XYZ):

    def Vec3(self, float * XYZ):

    def Vec3(self, int * XYZ):

    def void Assign(self, double * XYZ):

    def void operator / =(self,double xIn):

    def Vec3 operator /(self,double xIn):

    def void operator * =(self,double xIn):

    def Vec3 operator *(self,double xIn):

    def void operator + =(self,double xIn):

    def Vec3 operator +(self,double xIn):

    def void operator - =(self, Vec3 rhs):

    def Vec3 operator -(self, Vec3 rhs):

    def void operator + =(self, Vec3 rhs):

    def Vec3 operator +(self, Vec3 rhs):

    def double operator *(self, Vec3 rhs):

    def Vec3 Cross(self, Vec3 rhs):

    def double operator[](self,int idx):

    def double operator[](self,int idx):

    def double Magnitude2(self):

    def void Zero(self):

    def bint IsZero(self):

    def void Neg(self):

    def void SetVec(self,double vx, double vy, double vz):

    def double Normalize(self):

    def void Print(self, char *):

    def double Angle(self, Vec3):

    def double SignedAngle(self, Vec3, Vec3):

    def  double * Dptr(self):

    def double * Dptr(self):

