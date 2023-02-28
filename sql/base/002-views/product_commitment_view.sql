DROP VIEW IF EXISTS product_commitment_view;

CREATE VIEW product_commitment_view
AS
SELECT chain_id, cover_key, product_key, SUM(amount_to_cover) AS commitment
FROM policy.cover_purchased
WHERE expires_on > extract(epoch from now() at time zone 'utc')
GROUP BY chain_id, cover_key, product_key;

