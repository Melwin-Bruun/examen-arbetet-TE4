***Settings***
Library  list_methods.py

***Test Cases***
   

Test case add me to the queue function
    ${express_queue}=  Create List  jack  ola
    ${normal_queue}=  Create List  luke  bob
    ${value}=  list_methods.add_me_to_the_queue  ${express_queue}  ${normal_queue}  ${1}  chuck
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   ['jack', 'ola', 'chuck']
    ${value}=  list_methods.add_me_to_the_queue  ${express_queue}  ${normal_queue}  ${0}  chuck
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   ['luke', 'bob', 'chuck']



Test case find my friend function 
    ${normal_queue}=  Create List  luke  chuck  bob
    ${value}=  list_methods.find_my_friend  ${normal_queue}  bob
    SHOULD BE EQUAL  ${value}  ${2} 
    ${value}=  list_methods.find_my_friend  ${normal_queue}  chuck
    SHOULD BE EQUAL  ${value}  ${1} 
    ${value}=  list_methods.find_my_friend  ${normal_queue}  chuck
    SHOULD NOT BE EQUAL  ${value}  ${0} 
   
Test case add_me_with_my_friends function 
    ${normal_queue}=  Create List  luke  chuck  bob
    ${value}=  list_methods.add_me_with_my_friends  ${normal_queue}  ${1}  ola
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   ['luke', 'ola', 'chuck', 'bob']
    ${value}=  list_methods.add_me_with_my_friends  ${normal_queue}  ${2}  ola
    ${value}=  Convert to String  ${value}
    SHOULD NOT BE EQUAL  ${value}   ['luke', 'ola', 'chuck', 'bob']

Test case remove_the_mean_person function 
    ${normal_queue}=  Create List  luke  chuck  bob
    ${value}=  list_methods.remove_the_mean_person  ${normal_queue}  bob
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   ['luke', 'chuck']
    ${value}=  list_methods.remove_the_mean_person  ${normal_queue}  chuck
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}   ['luke']
    SHOULD NOT BE EQUAL  ${value}   ['chuck']

Test case how_many_namefellows function 
    ${normal_queue}=  Create List  luke  chuck  bob  chuck  luke  ola
    ${value}=  list_methods.how_many_namefellows  ${normal_queue}  bob
    SHOULD BE EQUAL  ${value}  ${1} 
    ${value}=  list_methods.how_many_namefellows  ${normal_queue}  luke
    SHOULD BE EQUAL  ${value}  ${2} 
    ${value}=  list_methods.how_many_namefellows  ${normal_queue}  ola
    SHOULD NOT BE EQUAL  ${value}  ${2} 


Test case remove_the_last_person function 
    ${normal_queue}=  Create List  luke  chuck  bob  
    ${value}=  list_methods.remove_the_last_person  ${normal_queue}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}  bob
    ${normal_queue}=  Create List  luke  chuck  bob 
    ${value}=  list_methods.remove_the_last_person  ${normal_queue}
    ${value}=  Convert to String  ${value}
    SHOULD NOT BE EQUAL  ${value}  chuck

Test case sorted_names function 
    ${normal_queue}=  Create List  luke  chuck  bob  
    ${value}=  list_methods.sorted_names  ${normal_queue}
    ${value}=  Convert to String  ${value}
    SHOULD BE EQUAL  ${value}  ['bob', 'chuck', 'luke']
    ${normal_queue}=  Create List  luke  chuck  bob 
    ${value}=  list_methods.sorted_names  ${normal_queue}
    ${value}=  Convert to String  ${value}
    SHOULD NOT BE EQUAL  ${value}  ['luke', 'chuck', 'bob']