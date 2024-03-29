
public with sharing class task52c
{
    public List<Contact> contacts { get; set; }
    public String name { get; set; }
    public String Email { get; set; }

    public task52c()
    {
        contacts = new List<Contact>();
    }

    public PageReference searchContacts()
    {
        contacts = [select Id
                          ,Name
                          ,Email 
                     from Contact 
                    where Name = :name
                    and Email = :Email];
        return null;
    }
}
