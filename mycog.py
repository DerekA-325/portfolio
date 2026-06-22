import discord
from redbot.core import commands
import os
import gspread

class MyCog(commands.Cog):
    def __init__(self, bot):
        self.bot = bot
        base_dir = os.path.dirname(os.path.abspath(__file__))
        json_path = os.path.join(base_dir, 'service_account.json')

        try:
            self.gc = gspread.service_account(filename=json_path)
            spreadsheet = self.gc.open("Left Scape")
            self.sh = spreadsheet.get_worksheet(1) 
            print("Successfully connected to the second sheet!")
        except Exception as e:
            print(f"CRITICAL: Failed to initialize Google Sheet: {e}")
            self.sh = None 

    async def get_user_row(self, user_id):
        if not self.sh:
            return None
        records = self.sh.get_all_records(numericise_ignore=['all'])
        return next((row for row in records if str(row.get("Discord ID")) == str(user_id)), None)

    @commands.command()
    async def clan(self, ctx, option: str = None): 
        """
        View your clan stats. 
        Usage: !clan [points/rank/events/invites/etc] or !clan summary
        """
        user_row = await self.get_user_row(ctx.author.id)

        if not user_row:
            return await ctx.send("User not found in the database.")

        # Helper to safely get data from the row
        def get_val(col):
            val = user_row.get(col)
            return val if val not in ["", None] else "0"
        
        if not option:
            return await ctx.send("Please provide a valid option. Try: summary, points, rank, events, invites, raids, botw, sotw, or pk.")

        option = option.lower()

        if option in ["summary", "all", "stats"]:
            embed = discord.Embed(
                title=f"Clan Profile: {ctx.author.display_name}",
                color=discord.Color.blue()
            )
            embed.add_field(name="Join Date", value=get_val("join date"), inline=True)
            embed.add_field(name="Rank", value=get_val("rank(s)"), inline=True)
            embed.add_field(name="Points", value=get_val("points"), inline=True)
            embed.add_field(name="Events", value=get_val("events"), inline=True)
            embed.add_field(name="Raids", value=get_val("Raid Count"), inline=True)
            embed.add_field(name="PK", value=f"PK: {get_val('PK Count')}", inline=True)
            embed.add_field(name="Weeklies", value=f"BOTW: {get_val('BOTW Podiums')} | SOTW: {get_val('SOTW Podiums')}", inline=True)
            embed.add_field(name="Host", value=f"H: {get_val('Event Host')}", inline=True)
            embed.add_field(name="Invites", value=get_val("Invites"), inline=True)
            
            embed.set_footer(text="Left Scape Clan Database")
            return await ctx.send(embed=embed)

        elif option in ["joindate", "joined"]:
            column = "join date"
        elif option == "events":
            column = "events"
        elif option == "points":
            column = "points"
        elif option == "rank":
            column = "rank(s)"
        elif option in ["host", "eventhost"]:
            column = "Event Host"
        elif option == "invites":
            column = "Invites"
        elif option == "raids":
            column = "Raid Count"
        elif option == "botw":
            column = "BOTW Podiums"
        elif option == "sotw":
            column = "SOTW Podiums"
        elif option == "pk":
            column = "PK Count"
        else:
            return await ctx.send("Invalid option. Try: summary, points, rank, events, invites, raids, botw, sotw, or pk.")

        # If it wasn't a summary, send the single-stat embed
        display_data = get_val(column)
        embed = discord.Embed(
            title=f"{column.title()}",
            description=f"**{ctx.author.display_name}:** {display_data}",
            color=discord.Color.green()
        )
        await ctx.send(embed=embed)

