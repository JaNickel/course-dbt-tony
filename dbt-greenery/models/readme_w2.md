1. what is the repeat rate?
    a bit more than 80%
2. What are good indicators of a user who will likely purchase again? 
     using: select order_count, count(1) from dbt_tony_nickel.orders_per_user group by order_count order by order_count;
     If they have already purchased 2 or 3 
     if they have purchased Monstera, Money Tree, Bird of Paradise, or Rubber plant (what people with 4 or more order bought that people with 1 did not)
        select name, sum(ctr) order_ctr from dbt_tony_nickel.repeat_user_products where order_count>3 and name not in (select name from dbt_tony_nickel.repeat_user_products where order_count=1) group by name;
   What about indicators of users who are likely NOT to purchase again?
    If they have purchased 5 or more 

Core  - time to delivery, value of products
Marketing - promotion usage
Product - products ordered

(Part 2) Tests
We added some more models and transformed some data! Now we need to make sure they’re accurately reflecting the data. Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above
What assumptions are you making about each model? (i.e. why are you adding each test?)
Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
Apply these changes to your github repo
Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
