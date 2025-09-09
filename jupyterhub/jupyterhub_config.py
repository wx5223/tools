import os
c = get_config()
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'

c.DockerSpawner.image = 'quay.io/jupyter/pytorch-notebook:cuda12-2025-04-24'

c.DockerSpawner.allowed_images = ['quay.io/jupyter/pytorch-notebook:cuda12-2025-04-24','quay.io/jupyter/base-notebook:latest']

c.DockerSpawner.use_internal_ip = True
c.DockerSpawner.network_name = 'jupyterhub'

notebook_dir = os.environ.get('DOCKER_NOTEBOOK_DIR') or '/work'
c.DockerSpawner.notebook_dir = notebook_dir

# Mount the real user's Docker volume on the host to the notebook user's
# notebook directory in the container
c.DockerSpawner.volumes = { 'jupyterhub-user-{username}': notebook_dir }

# Mount a directory on the host to the notebook user's notebook directory in the container
c.DockerSpawner.mounts = [
  {'source': '/data/jupyter/share', 'target': notebook_dir+'/share', 'type': 'bind'}
]

import docker
c.DockerSpawner.extra_host_config = {"privileged": True,"shm_size":"10G","device_requests": [docker.types.DeviceRequest(
    device_ids=["all"],
    capabilities=[["gpu"]],
)]}

# Remove containers once they are stopped
c.DockerSpawner.remove = False

# For debugging arguments passed to spawned containers
c.DockerSpawner.debug = True

# User containers will access hub by container name on the Docker network
c.JupyterHub.hub_ip = "jupyterhub"
c.JupyterHub.hub_port = 8080

# Allow all signed-up users to login
c.Authenticator.allow_all = True

# Authenticate users with Native Authenticator
c.JupyterHub.authenticator_class = "nativeauthenticator.NativeAuthenticator"
import os, nativeauthenticator
c.JupyterHub.template_paths = [f"{os.path.dirname(nativeauthenticator.__file__)}/templates/"]
# Allow anyone to sign-up without approval
c.NativeAuthenticator.enable_signup = True
c.NativeAuthenticator.open_signup = False
c.NativeAuthenticator.ask_email_on_signup = False
c.Authenticator.allowed_failed_logins = 10

c.Authenticator.admin_users = ["admin"]

c.DockerSpawner.extra_create_kwargs = {
    "user": "root" # Can also be an integer UID
}
c.DockerSpawner.environment = {
	"NB_USER": "root", "NB_UID":0, "NB_GID":0, "HOME": notebook_dir
}
c.DockerSpawner.cmd = ["jupyterhub-singleuser", "--allow-root"]

