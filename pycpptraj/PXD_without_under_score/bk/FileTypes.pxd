# distutils: language = c++
from libcpp.string cimport string
from BaseIOtype cimport *
from ArgList cimport *


cdef extern from "FileTypes.h": 
    cdef cppclass FileTypes::KeyToken "FileTypes::KeyToken":
    cdef cppclass FileTypes "FileTypes":
        FileFormatType GetFormatFromArg(KeyPtr, ArgList&, FileFormatType)
        FileFormatType GetFormatFromString(KeyPtr, const string&, FileFormatType)
        string GetExtensionForType(KeyPtr, FileFormatType)
        FileFormatType GetTypeFromExtension(KeyPtr, const string&, FileFormatType)
        const char * FormatDescription(AllocPtr, FileFormatType)
        BaseIOtype * AllocIO(AllocPtr, FileFormatType, bint)
        void ReadOptions(KeyPtr, AllocPtr, FileFormatType)
        void WriteOptions(KeyPtr, AllocPtr, FileFormatType)
    cdef cppclass FileTypes::AllocToken "FileTypes::AllocToken":
