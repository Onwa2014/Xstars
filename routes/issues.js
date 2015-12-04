exports.show =function (req, res, next){
    req.getConnection(function(err, connection){
        if (err) 
                return next(err);
        connection.query('SELECT Issues.Id,Issues.description,taxiAssociation_name,Ranks.Rank_name,DATE_FORMAT(Issues.date, "%d/%m/%Y") as Date,Issues.rank_id FROM Issues INNER JOIN Taxi_associations ON Issues.association_id = Taxi_associations.id INNER JOIN Ranks ON Issues.rank_id = Ranks.id ORDER BY Issues.date DESC',[],function(err, issuesresults){
            if (err) 
                    return next(err);
        connection.query('SELECT * from Ranks',[], function(err, rankList){
            if(err)
                return next("Error Selecting : %s ", err);
                var issue = issuesresults[0];
                console.log(issue)

                var ranks = rankList.map(function(Rank_name){
                    return {
                        id : Rank_name.id,
                        Rank_name : Rank_name.Rank_name,
                        selected : Rank_name.id === issue.id
                    }
                });


                res.render('home',{
                    ranks:issuesresults
                    });
            });
        });
    });
}

exports.getIssues =function (req, res, next){
    req.getConnection(function(err, connection){
        if (err) 
                return next(err);
    
        connection.query('SELECT Issues.Id,Issues.description,taxiAssociation_name,Ranks.Rank_name,DATE_FORMAT(Issues.date, "%d/%m/%Y") as Date,Issues.rank_id FROM Issues INNER JOIN Taxi_associations ON Issues.association_id = Taxi_associations.id INNER JOIN Ranks ON Issues.rank_id = Ranks.id ORDER BY Issues.date DESC',[],function(err, issuesresults){
        if (err) 
                return next(err);

            res.render('issuesHist',{
                issues : issuesresults
            	});
            });
        });
    
}



exports.add = function (req, res, next) {
    req.getConnection(function(err, connection){
        if (err) return next(err);
        var input = JSON.parse(JSON.stringify(req.body));
        console.log(input)
        var data = {
            description : input.description,
            date :input.date,
            Rank_name:input.Rank_name,
            reg_number:input.reg_number,
            association_id: input.association_id,
            rank_id:input.rank_id,
            //start_location_latitude : input.latitude,
            //start_location_longitude :input.longitude,
            //start_location_time:input.time
            start_location_latitude : input.latitude,
            start_location_longitude :input.longitude,
            start_location_time:input.time,            
            end_location_latitude:input.latitude,
            end_location_longitude: input.longitudes,
            end_location_time: input.time
            //start_location_longitude : input.latitude, 
            //end_location_id : input.latitude,
            //taxiAssociation_name : input.taxiAssociation_name,
            //Rank_name: input.Rank_name

        };      
             
        connection.query('insert into Issues set ?', data, function(err, results){
            if (err) return next(err);
            console.log("Error inserting : %s ",err );
            res.redirect('/issues');
        });
    });
}

exports.update = function(req, res, next){

    var data = JSON.parse(JSON.stringify(req.body));
    var id = req.params.id;
    req.getConnection(function(err, connection){
            connection.query('UPDATE Issues SET ? WHERE id = ?',[data, id], function(err, rows){
                if (err) return next(err);
                res.redirect('/issues');
            });

    });
}

exports.get = function(req, res, next){
    var Id = req.params.Id;
    req.getConnection(function(err, connection){
        connection.query('SELECT * FROM Issues WHERE Id = ?', [Id], function(err,rows){
            //connection.query('SELECT * FROM Taxi_associations', [], function(err, results) {   
                if(err) return next(err);
                console.log(results);
                res.render('edit',{page_title:"Edit Issues - Node.js", 
                data : rows[0],
                //associations : results
                //});
            });
        });
    });
}

exports.delete = function(req, res, next){
    var id = req.params.id;
    req.getConnection(function(err, connection){
        connection.query('DELETE FROM Issues WHERE id = ?', [id], function(err,rows){
            if(err) return next(err);
            res.redirect('/issues');
        });
    });
}