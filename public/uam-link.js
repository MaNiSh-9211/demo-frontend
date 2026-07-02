/** UAM frontend URL (AuthAdvance login, OAuth, dashboard). Same host, port 8091 in dev. */
function uamUrl(path) {
  const port = window.UAM_FRONTEND_PORT || '8091';
  return `${window.location.protocol}//${window.location.hostname}:${port}${path}`;
}
