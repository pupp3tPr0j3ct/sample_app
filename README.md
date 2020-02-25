# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial: Learn Web Development with Rails*] (http://www.railstutorial.org/) 
by [Michael Hartl] (http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial] (http://railstutorial.org/) is available jointly under the MIT License and the Beerware License. See [License.md] (License.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rake db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails server
```

# Temporary workaround to SendGrid environment issues...

Run these ecommands in terminal:

```
$ echo "export SENDGRID_API_KEY='YOUR_KEY_HERE'" > sendgrid.env
```

Next, run this command:

```
$ echo "sendgrid.env" >> .gitignore
```

Finally, input this command:

```
source ./sendgrid.env
```


For more information, see the [*Ruby on Rails Tutorial* book] (http://www.railstutorial.org/book).