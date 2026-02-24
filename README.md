# A/B Test: Marketing Campaign Performance  
### Multi-Variant Experiment Evaluation (Location-Level Sales)

---

## Objective

Determine which promotional campaign generates higher weekly sales and whether the observed lift is statistically reliable enough to justify rollout.

---

## Experimental Setup

- **Dataset:** `wa_marketing_campaign`  
- **Unit of analysis:** Location  
- **Granularity:** Weekly aggregated sales by `LocationID` and `PromotionID`  
- **Primary metric:** Mean weekly sales per location  
- **Variants:** Promotion 1, Promotion 2, Promotion 3  

Because three variants were tested simultaneously, multiple pairwise comparisons were required.

---

## Analytical Approach

- Aggregated weekly sales by location and campaign
- Tested for overall performance differences across variants (ANOVA)
- Conducted pairwise comparisons at a **99% confidence level** to reduce false-positive risk from multiple comparisons
- Interpreted both:
  - statistical significance (reliability)
  - practical effect size (business magnitude)

---

## Results

- Overall performance differences were statistically significant (ANOVA, **p < 0.01**).
- Promotion 1 significantly outperformed Promotion 2 at **99% confidence**.
- No statistically significant difference was detected between Promotion 1 and Promotion 3 at 99% confidence.
- Promotion 2 consistently underperformed relative to the other campaigns.

---

## Business Interpretation

- **Discontinue or redesign Promotion 2** due to statistically validated underperformance.
- **Treat Promotions 1 and 3 as comparable top performers**; select based on margin impact, operational complexity, and scalability (not sales alone).
- If a single winner is required, run a **higher-powered follow-up test** to confidently distinguish between Promotions 1 and 3.

---

## Key Insight

Even when a result is statistically significant, the final decision should weigh the size of the sales lift against margin and operational impact.

---

## Deliverables
- **SQL:** Campaign-level aggregation queries used for analysis [sql](sql/)
- **Statistical testing:**  Pairwise comparison outputs + assumptions summary [analysis](analysis/)
