#include<iostream>
using namespace std;

int main() 
{
    int num;
    cin >> num;

    int goal=0;
    int fail=0;

    for (int i=0;i<num;i++)
    {
        int n;
        cin >> n;

        if (n==1)
        {
            ++goal;

            if (goal>fail)
            {
                fail = goal;
            }    
        }    
        else
        {
            goal = 0;
        }
    
    }
    cout << fail <<'\n';
     
    return 0;
}
