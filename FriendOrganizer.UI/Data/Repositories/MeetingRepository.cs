﻿using FriendOrganizer.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using FriendOrganizer.Model;


namespace FriendOrganizer.UI.Data.Repositories
{
    public class MeetingRepository : GenericRepository<Meeting, FriendOrganizerDbContext>, IMeetingRepository
    {
        public MeetingRepository(FriendOrganizerDbContext context) : base(context)
        {

        }

        public async override Task<Meeting> GetByIdAsync(int id)
        {
            return await Context.Meetings
                 .Include(m => m.Friends)
                 .SingleAsync(m => m.Id == id);

        }

        public async Task<List<Friend>> GetAllFriendsAsync()
        {
            return await Context.Set<Friend>()
                .ToListAsync();
        }

        public async Task ReloadFriendAsync(int friendId)
        {
            var dbEntityEntry = Context.ChangeTracker.Entries<Friend>()
                .SingleOrDefault(db => db.Entity.Id == friendId);
            if (dbEntityEntry != null)
            {
                await dbEntityEntry.ReloadAsync();
            }
        }
    }
}
