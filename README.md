# A/B Test: Fast Food Marketing Campaign Performance

## Goal
Identify which marketing campaign drives the highest weekly sales and should be rolled out across locations, using statistical testing.

## Business context
A fast-food chain tested **three different promotional campaigns** across multiple restaurant locations.
The objective was to determine which promotion performs best and whether the observed differences are **statistically significant**, not just random variation.

Key business question:
> Which marketing campaign leads to higher sales and is the improvement reliable enough to justify a rollout?

## Data
- **Source:** `wa_marketing_campaign` dataset
- **Unit of analysis:** Location
- **Granularity:** Weekly aggregated sales by `LocationID` and `PromotionID`
- **Metric:** Weekly sales

### Data considerations
- Data is **aggregated**, not user-level
- Multiple weeks per location
- Three campaigns tested simultaneously

## Experiment design
- **Variants:** Three campaign promotions
- **Experimental unit:** Location
- **Outcome metric:** Mean weekly sales per location
- **Comparison method:** Pairwise comparisons between campaigns

Because more than two variants were tested, multiple statistical tests were required.

## Hypotheses
- **Null hypothesis (H₀):** There is no difference in mean weekly sales between the marketing campaigns.
- **Alternative hypothesis (H₁):** At least one marketing campaign has a different mean weekly sales performance.

## Statistical approach
- Aggregated weekly sales by location and campaign
- Conducted **pairwise hypothesis tests** to compare campaign performance
- Used a **99% confidence level** (instead of 95%) to control for the **multiple testing problem**
- Statistical tests were performed using Evan Miller's A/B test Calculator based on aggregated location-level metrics.
- Interpreted both:
  - statistical significance
  - practical effect size
 
Using a stricter confidence level reduces the risk of **false positives** when running multiple comparisons.

## Result
- A statistically significant difference was detected between campaigns (ANOVA, p < 0.01), indicating that at least one promotion performed differently.
- Pairwise testing at a 99% confidence level showed that **Promotion 1 significantly outperformed Promotion 2** in mean weekly sales.
- No statistically significant difference was found between **Promotion 1 and Promotion 3**, despite Promotion 3 having the highest total sales.
- Promotion 2 consistently underperformed relative to the other two campaigns.

## Recommendation
- Discontinue or redesign **Promotion 2**, as it underperforms both alternatives with statistical confidence.
- Treat **Promotion 1 and Promotion 3 as comparable top performers**, as no significant difference was detected at the 99% confidence level.
- Select between Promotion 1 and Promotion 3 based on **business constraints** (cost, operational complexity, margin impact), not just sales volume.
- If a single winner is required, run a follow-up experiment with higher power to distinguish between Promotions 1 and 3.

## Deliverables
- **SQL:** Campaign-level aggregation queries used for analysis [sql](sql/)
- **Statistical testing:** External A/B test calculator results and assumptions [analysis](analysis/)
