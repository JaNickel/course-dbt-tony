What is our overall conversion rate?
    Using conversion = 
            sessions/orders 36%
            page views / checkouts 30%
            sessions / checkouts 0.69%

What is our conversion rate by product?

select name, order_ctr, session_ctr, (order_ctr*1.0)/(session_ctr*1.0) as conv_rate From dbt_tony_nickel.product_conversions;
 name         	   	            conv_rate        
 Bird of Paradise    	35	59	59.32%
 Devil's Ivy         	31	60	51.67%
 Dragon Tree         	36	65	55.38%
 Pothos              	25	50	50.00%
 Philodendron        	35	58	60.34%
 Rubber Plant        	36	63	57.14%
 Angel Wings Begonia 	31	45	68.89%
 Pilea Peperomioides 	33	57	57.89%
 Majesty Palm        	37	61	60.66%
 Aloe Vera           	38	59	64.41%
 Spider Plant        	32	62	51.61%
 Bamboo              	38	71	53.52%
 Alocasia Polly      	28	50	56.00%
 Arrow Head          	41	73	56.16%
 Pink Anthurium      	35	56	62.50%
 Ficus               	37	58	63.79%
 Jade Plant          	24	42	57.14%
 ZZ Plant            	39	69	56.52%
 Calathea Makoyana   	33	50	66.00%
 Birds Nest Fern     	35	63	55.56%
 Monstera            	28	51	54.90%
 Cactus              	33	61	54.10%
 Orchid              	38	66	57.58%
 Money Tree          	29	56	51.79%
 Ponytail Palm       	30	54	55.56%
 Boston Fern         	32	53	60.38%
 Peace Lily          	28	60	46.67%
 Fiddle Leaf Fig     	32	49	65.31%
 Snake Plant         	35	59	59.32%
 String of pearls    	43	79	54.43%

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(2) We’re getting really excited about dbt macros after learning more about them and want to apply them to improve our dbt project.
Create a macro to simplify part of a model(s). Think about what would improve the usability or modularity of your code by applying a macro. Large case statements, or blocks of SQL that are often repeated make great candidates. Document the macro(s) using a .yml file in the macros directory.
Note: One potential macro in our data set is aggregating event types per session. Start here as your first macro and add other macros if you want to go further.
    Created a macro to get the product id from the page_url

(3) We’re starting to think about granting permissions to our dbt models in our postgres database so that other roles can have access to them.
Add a post hook to your project to apply grants to the role “reporting”. Create reporting role first by running "CREATE ROLE reporting" in your database instance.
NOTE:: After you create the role you still need to grant it usage access on your schema dbt_firstname_lastname which can be done using on-run-end
HINT: you can use the grant macro example from this week and make any necessary changes for postgres syntax
    added to dbt-project
    on-run-end:
  - "grant usage on {{ this }} to role reporter"

(4) After learning about dbt packages, we want to try one out and apply some macros or tests.
Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project


(5) After improving our project with all the things that we have learned about dbt, we want to show off our work!

Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.