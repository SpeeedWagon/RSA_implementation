#include <iostream>
#include "../lib/includes/utils.h"
#include <gmpxx.h>

int main(){
    show();
    mpz_class n("12929222");
    std::cout<<"I am: "<< n.get_str() <<" years old!\n";
}