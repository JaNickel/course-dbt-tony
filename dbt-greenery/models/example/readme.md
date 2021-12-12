How are our users moving through the product funnel?
Which steps in the funnel have largest drop off points?
    select sum(page_views) as page_views, sum(adds_to_cart) adds_to_cart, sum(checkouts) as checkouts from dbt_tony_nickel.fact_event_type_counts;
    page_views=1359
    adds_to_cart=1007
    checkouts = 400
    page_views - adds_to_cart = 352
    adds_to_cart / page_views = 0.74
    adds_to_cart - checkout = 607
    checkouts / adds_to_cart = 0.4
    biggest loss addst to cart -> Checkout
Sessions with any event of type page_view / add_to_cart / checkout = 2766
Sessions with any event of type add_to_cart / checkout  = 1407
Sessions with any event of type checkout = 400


Reflection questions -- please answer 2A or 2B, or both!

2A. dbt next steps for you
Reflecting on your learning in this class...
if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?
    Cost: Cheap to get, Fast to implement, Speed to start
    Advantages over current method: Better visability source to product. Integated with GIT. 

