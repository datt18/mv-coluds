@isTest
public class test_trigger_task10 {
  @isTest
  private static void testSubmitNewAccountForApproval(){

    // Create a new account
    Account acc = new Account(Name = 'Test Account');
    insert acc;

    // Verify approval process started
    
    System.assertEquals('Pending', result.Status);
    System.assertEquals('Pending', result.StepStatus);
  }
}