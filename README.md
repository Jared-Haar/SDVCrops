# SDVCrops
A repository for my work on Stardew Valley crop profitability

Hi, my name is Jared, and thanks for checking out this sheet. This tab is here as an introduction to everything you'll find in the sheet, so if you get confused hopefully this page can help!

Variables:
Crop: The name of the crop
Seed price: How much the seeds cost at Pierre's
Sale Price: How much a basic quality crop sells for (no star)
Silver: How much a silver quality crop sells for
Gold: How much an gold quality crop sells for
Iridium: How much an iridium quality crop sells for
Growth time: Number of days between planting the seed and harvesting the crop
Regrowth Time: For regrowth only, the number of days between harvests once the plant is fully grown
# of Harvests (H): The number of times a crop can be harvested per season, when planted back-to-back (this is a number representing the calendadrs that are shown on each crop's page on the wiki)
Extra Harvest: This accounts for any crops that always or have a chance to produce multiple products when harvested, from the wiki (ex: Potatoes have a 25% chance to be a double harvest, so their multiplier is 1.25)
Profit/Plant: Sale Price - Seed Price
G/day/Plant: (Profit/Plant)/Growth Time (This looks different for the 1 harvest and regrowth plants, I just used the equation from the crops page on the wiki)
Revenue Ratio: Sale Price/Seed Price
n: Starting money/investment

1 harvest specific:
(((RR-1)(H-1))+RR) (Fixed n, whole season): This is a coefficient that, when multiplied by n, gives the minimum amount of earned/total gold (revenue) at the end of the season, if the same number of crops are planted after each harvest
RR^H (Increasing n, whole season): This coefficient, when multiplied by n, gives the minimum amount of total gold at the end of the season, if the proceeds from every harvest are fully reinvested each harvest (growing the maximum number of crops each cycle)
Max RR: Same as Revenue Ratio above, but using the gold quality sale price instead of the base price for crops
Max fixed n: Same as the fixed n equation above, just using the max RR instead of the standard RR
Max increasing n: Same as the increasing  n equation above, just using the max RR instead of the standard RR

Regrowth specific:
RR*H (Increasing n, whole season): Coefficient that when multiplied by n gives total gold at the end of the season when the regrowable crops are only planted once and are harvested over their maximum lifetime (ex: corn gets 2 seasons of harvests
RR^i (RR*H, with reinvestment): Coefficient that when multiplied by n gives total gold at the end of the season when regrowable crops are replanted on the day of a harvest, when reasonable (this is what the calendar tabs were used for, to determine when replantings or harvests would happen) (RR^i is shorthand, I don't have a definition for i)
Max RR: Same as the other Max RR, just RR using the gold quality crop price instead of the base price
Max RR*H: Same as RR*H for the whole season above, just using Max RR instead of RR
Max RR^1: Same as RR^I above, just using Max RR instead of RR


Equation Breakdown
(((RR-1)(H-1))+RR) (Fixed n, whole season)
    n is our starting money
    n/seed price gets us the number of seeds we can purchase
    (n/seed price)*sale price gets us our (minimum) total money after the harvest
    n(sale price/seed price) is the same as above, but this is also n*RR
    If we purchase the same amount of seeds after our first harvest as we did originally, our money will be (n*RR)-n, and we will have new seeds to plant
    We will purchase new seeds for every harvest except the last one (H-1), so to account for multiple harvests in a season we do ((n*RR)-n)*(H-1), repeating the above calculation for as many times as it is reasonable to do it.
    To get our end of season total, we add one more n*RR to ((n*RR)-n)*(H-1) to account for the final harvest where we will not buy new seeds. (((n*RR)-n)*(H-1))+(n*RR)
    We want to factor out n, because it is the ony variable in this equation, and everything else is known and can be used in our coefficient. Taking n from each term looks like this: ((n*(RR-1)*(H-1))+(n*(RR))
    Factoring n out again gets us: n(((RR-1)*(H-1))+RR)
    Therefore, we have the coefficient (((RR-1)*(H-1))+RR), which we can multiply by any n to predict our total gold at the end of the season (more specifically at the end of the final harvest)
    
RR^H (Increasing n, whole season)
    n is our starting money
    n/seed price gets us the number of seeds we can purchase
    (n/seed price)*sale price gets us our (minimum) total money after the harvest
    n(sale price/seed price) is the same as above, but this is also n*RR
    If we want to reinvest all of our money from the first harvest into seeds, then our new starting money for the second planting is n*RR
    This means that the total money we will have upon the end of our second harvest is (n*RR)*RR, since we take the total we are investing, divide it by seed price, then multiply it by sale price to get the new total
    The above equation can be re-written as n*(RR^2)
    Each additional harvest means we multiply by another RR, so the general equation is n*(RR^H)
    I call this the "increasing n" equation not because n itself is increasing, but because this means we are planting more plants each time than we harvested, and the principal amount being invested in each planting is increasing.
    
RR*H (whole season, no reinvestment) 
    n is our starting money
    n/seed price gets us the number of seeds we can purchase
    (n/seed price)*sale price gets us our (minimum) total money after the harvest
    n(sale price/seed price) is the same as above, but this is also n*RR
    Since regrowable crops have no costs associated with their regrowth (we don’t need to buy new seeds), then each new harvest adds an additional n*RR to our total (we make the same amount of money each harvest)
    Therefore, we can do (n*RR)*H to find the total amount of money we will have at the end of the season, if we only plant once at the beginning of the season (no reinvestment).
    
RR^i (RR*H, with reinvestment)
    n is our starting money
    n/seed price gets us the number of seeds we can purchase
    (n/seed price)*sale price gets us our (minimum) total money after the harvest
    n(sale price/seed price) is the same as above, but this is also n*RR
    Since regrowable crops have no costs associated with their regrowth (we don’t need to buy new seeds), then each new harvest adds an additional n*RR to our total (we make the same amount of money each harvest)
    However, if we are willing to reinvest in new seeds during the middle of the season, some of our early harvests will have their proceeds spent on new seeds, while late harvests will be harvested for their full value as replanting is unreasonable (not enough harvests left in the season to make money).
    From RR^H:
        This means that the total money we will have upon the end of our second harvest is (n*RR)*RR, since we take the total we are investing, divide it by seed price, then multiply it by sale price to get the new total
        The above equation can be re-written as n*(RR^2)
    Bringing this in for regrowable crops, that means that each additional planting multiplies by another RR, so original plants produce a value of n*RR each harvest, but the plants that are planted with the proceeds from a harvest of the original plants produce a value of n*(RR^2) each harvest
    This gets very complex fast, and I don’t have a general equation for it. However, my work is shown in each of the calendar tabs, where I identify which harvests are reinvested and which are just sold, which planting round they are a part of (which is the exponent the RR is raised to for that harvest), and how many plants are present (scales n*(RR^i) for how much reinvestment is coming back at that round.
        Ex: I walk-through the cranberries calendar tab as a "simpler" example