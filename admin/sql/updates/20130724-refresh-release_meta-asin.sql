BEGIN;

UPDATE release_meta SET amazon_asin = asins[1]
FROM (
  SELECT release, asins
  FROM (
    SELECT entity0 AS release,
      array_agg(
        regexp_replace(url.url, E'^http://(?:www.)?(.*?)(?:\\:[0-9]+)?/.*/([0-9B][0-9A-Z]{9})(?:[^0-9A-Z]|$)', E'\\2')
        ORDER BY l_release_url.last_updated DESC
      ) asins
    FROM l_release_url
    JOIN link ON l_release_url.link = link.id
    JOIN url ON l_release_url.entity1 = url.id
    WHERE link.link_type = 77
    GROUP BY l_release_url.entity0
  ) all_asins
  JOIN release_meta ON release_meta.id = all_asins.release
  WHERE NOT (amazon_asin = any(asins))
) mismatched
WHERE mismatched.release = release_meta.id;

COMMIT;
