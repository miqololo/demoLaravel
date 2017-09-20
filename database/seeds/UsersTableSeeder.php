<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();

        for($i = 0; $i < 200; $i++) {
            App\User::create([
                'username' => $faker->userName,
                'first_name' => $faker->firstName,
                'last_name' => $faker->lastName,
                'password'=>$faker->password
            ]);
        }
        $user = App\User::create([
            'username' => "admin",
            'first_name' => "Admin",
            'last_name' => "Admin",
            'active' => 1,
            'password'=>"Qw123456"
        ]);

        $permission1 = new Spatie\Permission\Models\Permission();
        $permission2 = new Spatie\Permission\Models\Permission();
        $permission3 = new Spatie\Permission\Models\Permission();
        $permission4 = new Spatie\Permission\Models\Permission();
        $permission1->name="edit";
        $permission1->save();
        $permission2->name="create";
        $permission2->save();
        $permission3->name="delete";
        $permission3->save();
        $permission4->name="status";
        $permission4->save();

        $role = new Spatie\Permission\Models\Role();
        $role->name = "super_admin";
        $role->save();
        $role->givePermissionTo($permission1);
        $role->givePermissionTo($permission2);
        $role->givePermissionTo($permission3);
        $role->givePermissionTo($permission4);
        $user->assignRole($role);
    }
}
