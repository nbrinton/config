# Atom Configuration

## Using the sync-settings Package:

1) Install sync-settings package in new Atom instance
2) Enter the following info:
  * Personal Access Token: `02f1b0a96a32c07adc197c7ff1f22b64b4251cb4`
  * Gist ID: `6e48f81b5248c0f6574f56795f775fc4`
3) Press CTRL + SHIFT + P and then type sync and press "Sync Settings: Restore".

## Copying Config Files:
1) Save all of your packages to a file (from old/current install/instance of Atom):
~~~
	apm list --installed --bare > packages.list
~~~

2) Install your packages on your new Atom instance:
~~~
	apm install `cat packages.list`
~~~
or
~~~
	apm install --packages-file packages.list
~~~
3) Copy all of the `.json`, `.cson`, `.coffee`, and `.less` files into your `.atom/` directory.
