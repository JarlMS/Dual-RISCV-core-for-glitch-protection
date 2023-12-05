#include <iostream>

using namespace std;

int main(){
    int prev = 0;
    int current = 1;

    for (int i = 1; i < 20; i++) {
        int next = prev + current;
        prev = current;
        current = next;
    }
    
    cout << "Current: " << current << endl;
    return current;
}