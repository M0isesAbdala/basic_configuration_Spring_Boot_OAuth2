CREATE TABLE IF NOT EXISTS oauth2_registered_client (
    id varchar(100) PRIMARY KEY,
    client_id varchar(100) NOT NULL,
    client_id_issued_at timestamp NULL,
    client_secret varchar(200) NULL,
    client_secret_expires_at timestamp NULL,
    client_name varchar(200) NOT NULL,
    client_authentication_methods varchar(1000) NOT NULL,
    authorization_grant_types varchar(1000) NOT NULL,
    redirect_uris varchar(1000),
    post_logout_redirect_uris varchar(1000),
    scopes varchar(1000) NOT NULL,
    client_settings varchar(2000) NOT NULL,
    token_settings varchar(2000) NOT NULL
);

CREATE TABLE IF NOT EXISTS oauth2_authorization (
    id varchar(100) PRIMARY KEY,
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorization_grant_type varchar(100) NOT NULL,
    authorized_scopes varchar(1000),
    attributes blob,
    state varchar(500),
    authorization_code_value blob,
    authorization_code_issued_at timestamp NULL,
    authorization_code_expires_at timestamp NULL,
    authorization_code_metadata blob,
    access_token_value blob,
    access_token_issued_at timestamp NULL,
    access_token_expires_at timestamp NULL,
    access_token_metadata blob,
    access_token_type varchar(100),
    access_token_scopes varchar(1000),
    oidc_id_token_value blob,
    oidc_id_token_issued_at timestamp NULL,
    oidc_id_token_expires_at timestamp NULL,
    oidc_id_token_metadata blob,
    refresh_token_value blob,
    refresh_token_issued_at timestamp NULL,
    refresh_token_expires_at timestamp NULL,
    refresh_token_metadata blob,
    user_code_value blob,
    user_code_issued_at timestamp NULL,
    user_code_expires_at timestamp NULL,
    user_code_metadata blob,
    device_code_value blob,
    device_code_issued_at timestamp NULL,
    device_code_expires_at timestamp NULL,
    device_code_metadata blob
);

CREATE TABLE IF NOT EXISTS oauth2_authorization_consent (
    registered_client_id varchar(100) NOT NULL,
    principal_name varchar(200) NOT NULL,
    authorities varchar(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);

DROP INDEX idx_client_id ON oauth2_registered_client;
CREATE INDEX idx_client_id ON oauth2_registered_client (client_id);

DROP INDEX idx_authorization_client ON oauth2_authorization;
CREATE INDEX idx_authorization_client ON oauth2_authorization (registered_client_id);

DROP INDEX idx_authorization_principal ON oauth2_authorization;
CREATE INDEX idx_authorization_principal ON oauth2_authorization (principal_name);