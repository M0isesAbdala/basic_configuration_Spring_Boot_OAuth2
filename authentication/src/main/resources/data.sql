INSERT IGNORE INTO users (id, email, password, username) VALUES(1, 'admin@example.com', '$2a$10$PCPb40R2aXZDcUPAUBTJt.S5wgujE.Q/f42YP6AsD8eCmVn2vgBf.', 'admin');

INSERT IGNORE INTO role (id, name) VALUES(1, 'ADMIN');
INSERT IGNORE INTO role(id, name) VALUES(2, 'USER');

INSERT IGNORE INTO users_roles (user_id, role_id) VALUES(1, 1);

INSERT IGNORE INTO oauth2_registered_client (
    id,
    client_id,
    client_secret,
    client_name,
    client_authentication_methods,
    authorization_grant_types,
    redirect_uris,
    scopes,
    client_settings,
    token_settings
)
VALUES (
    '1',
    'client',
    '$2a$10$sfJ6FsEae67K3ArZWb7bYezPw8zDmb98EQMXEbRxPV1SHWwfCsp32',
    'client',
    'client_secret_basic',
    'client_credentials,refresh_token',
    null,
    'ADMIN',
    '{"@class":"java.util.HashMap","settings.client.require-authorization-consent":true}',
    '{"@class":"java.util.HashMap","settings.token.access-token-time-to-live":["java.time.Duration","PT1H"],"settings.token.refresh-token-time-to-live":["java.time.Duration","PT24H"],"settings.token.reuse-refresh-tokens":true}'
);

INSERT IGNORE INTO oauth2_registered_client (
    id,
    client_id,
    client_secret,
    client_name,
    client_authentication_methods,
    authorization_grant_types,
    redirect_uris,
    scopes,
    client_settings,
    token_settings
)
VALUES (
    '2',
    'web-client',
    '$2a$10$sfJ6FsEae67K3ArZWb7bYezPw8zDmb98EQMXEbRxPV1SHWwfCsp32',
    'web-client',
    'client_secret_basic',
    'authorization_code,client_credentials,refresh_token',
    'http://localhost:3000/login/oauth2/code/web-client-oidc',
    'openid,profile',
    '{"@class":"java.util.HashMap","settings.client.require-authorization-consent":true}',
    '{"@class":"java.util.HashMap","settings.token.access-token-time-to-live":["java.time.Duration","PT1H"],"settings.token.refresh-token-time-to-live":["java.time.Duration","PT24H"],"settings.token.authorization-code-time-to-live":["java.time.Duration","PT5M"],"settings.token.reuse-refresh-tokens":true}'
);