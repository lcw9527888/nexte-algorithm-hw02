#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int n;
    cin >> n;

    vector<int> ids(n);

    for (int i = 0; i < n; ++i)
    {
        cin >> ids[i];
    }

    sort(ids.begin(), ids.end());

    ids.erase(unique(ids.begin(), ids.end()), ids.end());

    cout << ids.size() << '\n';

    for (int i = 0; i < ids.size(); ++i)
    {
        cout << ids[i];

        if (i + 1 < ids.size())
        {
            cout << ' ';
        }
    }

    cout << '\n';

    return 0;
}
